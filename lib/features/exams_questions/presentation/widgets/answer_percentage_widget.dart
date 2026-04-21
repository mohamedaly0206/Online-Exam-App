import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/circular_percentage_indicator_widget.dart';

class AnswerPercentageWidget extends StatelessWidget {
  const AnswerPercentageWidget({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalAnswers,
  });
  final int correctAnswers;
  final int wrongAnswers;
  final int totalAnswers;

  @override
  Widget build(BuildContext context) {
    final double correctPct = totalAnswers == 0
        ? 0
        : (correctAnswers / totalAnswers);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Layer 1: Correct (Draws from 0 to X%)
        CircularPercentageIndicatorWidget(
          answers: correctAnswers.toDouble(),
          isCorrectAnswer: true,
          totalAnswers: totalAnswers.toDouble(),
        ),
        // Layer 2: Wrong (Draws from X% to 100%)
        CircularPercentageIndicatorWidget(
          answers: wrongAnswers.toDouble(),
          isCorrectAnswer: false,
          totalAnswers: totalAnswers.toDouble(),
          correctPercentage: correctPct, // Pass the offset
        ),
      ],
    );
  }
}
