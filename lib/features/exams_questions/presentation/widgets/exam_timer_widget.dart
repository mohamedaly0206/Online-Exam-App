import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';

class ExamTimerWidget extends StatelessWidget {
  const ExamTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocSelector<ExamsQuestionsCubit, ExamsQuestionsState, int>(
      selector: (state) => state.remainingTime,
      builder: (context, remainingTime) {
        final minutes = remainingTime ~/ 60;
        final seconds = remainingTime % 60;
        final formattedTime =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

        final initialTime = context
            .read<ExamsQuestionsCubit>()
            .state
            .initialExamTime;
        final isHalfTime = remainingTime <= (initialTime / 2);

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
