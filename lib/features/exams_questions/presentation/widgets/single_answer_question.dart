import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exam_questions_model.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/radio_answers.dart';

class SingleAnswerQuestion extends StatelessWidget {
  const SingleAnswerQuestion({super.key, required this.examQuestionModel});
  final ExamQuestionsModel examQuestionModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: examQuestionModel
                  .questions[state.currentQuestionIndex]
                  .answers
                  .length,
              itemBuilder: (context, index) => RadioAnswers(
                answers: examQuestionModel
                    .questions[state.currentQuestionIndex]
                    .answers[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
