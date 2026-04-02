import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentageIndicator extends StatelessWidget {
  const CircularPercentageIndicator({
    super.key,
    required this.answers,
    required this.totalAnswers,
    required this.isCorrectAnswer,
  });
  final double answers;
  final double totalAnswers;
  final bool isCorrectAnswer;
  double get percentage =>
      totalAnswers == 0 ? 0 : (answers / totalAnswers).clamp(0, 1);
  double get correctAnswersPercentage {
    if (totalAnswers == 0) return 0;
    return isCorrectAnswer
        ? answers / totalAnswers
        : (totalAnswers - answers) / totalAnswers;
  }

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
      lineWidth: 6,
      progressColor: isCorrectAnswer
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.error,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      startAngle: isCorrectAnswer
          ? 0
          : (360 * correctAnswersPercentage).clamp(0, 360),
      animation: true,
      animationDuration: 800,
    );
  }
}
