import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/widgets/dialogs/show_dialog.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_questions_view_body.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_timer_widget.dart';

class ExamsQuestionsView extends StatelessWidget {
  const ExamsQuestionsView({super.key, required this.examId});
  final String examId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExamsQuestionsCubit>(
      create: (context) =>
          getIt<ExamsQuestionsCubit>()
            ..handleExamsQuestionsIntent(StartExam(examId: examId)),
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              showQuitExamDialog(context);
            },
            child: SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                  title: AppStrings.exam,
                  actions: const [ExamTimerWidget()],
                  onBackPressed: () {
                    showQuitExamDialog(context);
                  },
                ),
                body: ExamQuestionsViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
