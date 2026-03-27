import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/back_and_next_buttons.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_question.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/time_out_widget.dart';

class ExamQuestionsViewBody extends StatelessWidget {
  const ExamQuestionsViewBody({super.key});
  final totalQuestions = 30;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamsQuestionsCubit, ExamsQuestionsState>(
      listener: (context, state) {
        if (state.remainingSeconds == 0) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Dialog(child: TimeOutWidget()),
          );
        }
      },
      child: BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Question ${state.currentQuestionIndex + 1} of $totalQuestions',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  minHeight: 6,
                  value: (state.currentQuestionIndex + 1) / totalQuestions,
                ),
                SizedBox(height: 8),
                ExamQuestion(),
                SizedBox(height: 80),
                BackAndNextButtons(),
              ],
            ),
          );
        },
      ),
    );
  }
}
