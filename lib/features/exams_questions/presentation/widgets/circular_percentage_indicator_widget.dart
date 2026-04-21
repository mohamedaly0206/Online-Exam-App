import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentageIndicatorWidget extends StatelessWidget {
  const CircularPercentageIndicatorWidget({
    super.key,
    required this.answers,
    required this.totalAnswers,
    required this.isCorrectAnswer,
    this.correctPercentage = 0, // Add this to know where to start the red arc
  });

  final double answers;
  final double totalAnswers;
  final bool isCorrectAnswer;
  final double correctPercentage;

  double get percentage =>
      totalAnswers == 0 ? 0 : (answers / totalAnswers).clamp(0, 1);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      center: isCorrectAnswer
          ? Text(
              "${(percentage * 100).toInt()}%",
              style: Theme.of(context).textTheme.titleLarge,
            )
          : null,
      percent: percentage,
      radius: 80,
      lineWidth: 6, // Made slightly thicker for better visibility
      progressColor: isCorrectAnswer
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.error,

      // CRITICAL: Only the bottom layer (Correct) should have a background color
      backgroundColor: isCorrectAnswer
          ? Theme.of(context).colorScheme.onSecondary
          : Theme.of(context).colorScheme.onTertiaryFixedVariant,

      // Start the "Wrong" arc exactly where the "Correct" arc ends
      startAngle: isCorrectAnswer ? 0 : (360 * correctPercentage),

      animation: true,
      animationDuration: 800,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
