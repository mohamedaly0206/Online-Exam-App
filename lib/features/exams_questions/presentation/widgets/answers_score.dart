import 'package:flutter/material.dart';

class AnswersScore extends StatelessWidget {
  const AnswersScore({
    super.key,
    required this.score,
    required this.answerKindName,
    required this.color,
  });
  final int score;
  final String answerKindName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          answerKindName,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: color),
        ),
        Container(
          padding: const EdgeInsets.all(2), // space for border
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color, // your border color
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            radius: 10,
            child: Text(
              score.toString(),
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: color),
            ),
          ),
        ),
      ],
    );
  }
}
