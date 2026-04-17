import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../../../../core/values/assets.gen.dart';
import '../../domain/entity/exams_entity.dart';

class ExamDetailsBody extends StatelessWidget {
  const ExamDetailsBody({super.key, required this.exam});

  final ExamEntity exam;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(Assets.a3dIcons.profit, width: 50),
                Text(AppStrings.language, style: theme.textTheme.headlineLarge),
                Spacer(),
                Text(
                  '${exam.duration} ${AppStrings.minutes}',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('${exam.title}', style: theme.textTheme.titleMedium),
                Text(
                  ' | ${exam.numberOfQuestions} ${AppStrings.question}',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(AppStrings.instructions, style: theme.textTheme.titleMedium),
            SizedBox(height: 16),
            Text(
              AppStrings.examInstructions,
              style: theme.textTheme.displayLarge!.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(AppRouterPaths.kExamQuestionsView, extra: exam.id);
              },
              child: Text(AppStrings.startButton),
            ),
          ],
        ),
      ),
    );
  }
}
