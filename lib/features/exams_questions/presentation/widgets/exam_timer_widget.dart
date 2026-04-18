import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';

class ExamTimerWidget extends StatelessWidget {
  const ExamTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamsQuestionsCubit>();
    final theme = Theme.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: cubit.examTimeNotifier,
      builder: (context, time, _) {
        final minutes = time ~/ 60;
        final seconds = time % 60;

        final formattedTime =
            '${minutes.toString().padLeft(2, '0')}:'
            '${seconds.toString().padLeft(2, '0')}';

        final isHalfTime = time <= (cubit.state.initialExamTime / 2);

        return Row(
          children: [
            Image.asset(Assets.a3dIcons.alarmLightBlue.path),
            const SizedBox(width: 8),
            Text(
              formattedTime,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: isHalfTime
                    ? theme.colorScheme.error
                    : theme.colorScheme.tertiary,
              ),
            ),
          ],
        );
      },
    );
  }
}
