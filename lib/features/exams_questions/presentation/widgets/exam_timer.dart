import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';

class ExamTimer extends StatelessWidget {
  const ExamTimer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Row(
          children: [
            Image.asset(Assets.a3dIcons.alarmLightBlue.path),
            const SizedBox(width: 8),
            Text(
              state.formattedTime,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: state.isHalfTime
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        );
      },
      buildWhen: (prev, curr) =>
          prev.examTimeInSeconds != curr.examTimeInSeconds,
    );
  }
}
