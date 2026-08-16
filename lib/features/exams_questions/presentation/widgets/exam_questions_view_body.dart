import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/errors/show_error_widget.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/back_and_next_buttons.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_question.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/time_out_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

class ExamQuestionsViewBody extends StatelessWidget {
  final String examId;
  const ExamQuestionsViewBody({super.key, required this.examId});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsQuestionsCubit, ExamsQuestionsState>(
      listener: (context, state) {
        if (state.isSubmitted && state.submitResult != null) {
          GoRouter.of(context).pushReplacement(
            AppRouterPaths.kExamScoreView,
            extra: state.submitResult as ExamResultEntity,
          );
        } else if (state.isExamFinished &&
            state.examsQuestionsState.errorMessage == null) {
          final cubit = context.read<ExamsQuestionsCubit>();

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) => BlocProvider.value(
              value: cubit,
              child: Dialog(
                child: TimeOutWidget(
                  correctAnswers: state.totalCorrectAnswers,
                  wrongAnswers: state.totalWrongAnswers,
                  totalQuestions: state.totalQuestions,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.examsQuestionsState.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.examsQuestionsState.errorMessage != null &&
            state.examsQuestionsState.data == null) {
          return Center(
            child: ShowErrorWidget(
              message: state.examsQuestionsState.errorMessage.toString(),
            ),
          );
        } else if (state.totalQuestions == 0) {
          return const Center(child: Text('No questions found.'));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Question ${state.currentQuestionIndex + 1} of ${state.totalQuestions}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 8),
              LinearProgressIndicator(
                minHeight: 6,
                value: state.totalQuestions == 0
                    ? 0
                    : (state.currentQuestionIndex + 1) / state.totalQuestions,
              ),
              SizedBox(height: 8),
              ExamQuestion(),
              SizedBox(height: 80),
              BackAndNextButtons(examId: examId),
            ],
          ),
        );
      },
      buildWhen: (prev, curr) =>
          prev.examsQuestionsState != curr.examsQuestionsState ||
          prev.currentQuestionIndex != curr.currentQuestionIndex,
    );
  }
}
