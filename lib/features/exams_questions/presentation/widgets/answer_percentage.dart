import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/circular_percentage_indicator.dart';

class AnswerPercentage extends StatelessWidget {
  const AnswerPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentageIndicator(
          answers: 28,
          isCorrectAnswer: true,
          totalAnswers: 30,
        ),
        CircularPercentageIndicator(
          answers: 2,
          isCorrectAnswer: false,
          totalAnswers: 30,
        ),
      ],
    );
  }
}
