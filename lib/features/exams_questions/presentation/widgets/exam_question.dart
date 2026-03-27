import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/multiple_answer_question.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/single_answer_question.dart';

class ExamQuestion extends StatelessWidget {
  const ExamQuestion({super.key});
  final bool isSingleAnswer = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select the correctly punctuated sentence.',
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 3,
        ),
        SizedBox(height: 24),
        isSingleAnswer ? SingleAnswerQuestion() : MultipleAnswerQuestion(),
      ],
    );
  }
}
