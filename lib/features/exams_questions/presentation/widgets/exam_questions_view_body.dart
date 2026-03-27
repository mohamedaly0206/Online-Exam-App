import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/back_and_next_buttons.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_question.dart';

class ExamQuestionsViewBody extends StatelessWidget {
  const ExamQuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Question 13 of 30',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(minHeight: 6, value: 13 / 30),
          SizedBox(height: 8),
          ExamQuestion(),
          SizedBox(height: 80),
          BackAndNextButtons(),
        ],
      ),
    );
  }
}
