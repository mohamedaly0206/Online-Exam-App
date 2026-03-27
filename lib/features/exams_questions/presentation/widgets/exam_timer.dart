import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';

class ExamTimer extends StatelessWidget {
  const ExamTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.a3dIcons.alarmLightBlue.path),
        const SizedBox(width: 8),
        Text(
          '30:00',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
