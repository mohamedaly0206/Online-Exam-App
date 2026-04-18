import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/check_box_answers.dart';

class MultipleAnswerQuestion extends StatelessWidget {
  const MultipleAnswerQuestion({super.key, required this.examQuestionModel});
  final ExamQuestionsEntity examQuestionModel;

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
              itemBuilder: (context, index) => CheckBoxAnswers(
                answer: examQuestionModel
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
