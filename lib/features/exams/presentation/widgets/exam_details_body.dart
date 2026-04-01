import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../../../../core/values/assets.gen.dart';
import '../../domain/model/exams_model.dart';

class ExamDetailsBody extends StatelessWidget {
  const ExamDetailsBody({super.key, required this.exam});

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(Assets.a3dIcons.profit.path, width: 50),
                Text(
                  AppStrings.language,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacer(),
                Text(
                  '${exam.duration} ${AppStrings.minutes}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${exam.title}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  ' | ${exam.numberOfQuestions} ${AppStrings.question}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              AppStrings.instructions,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              AppStrings.examInstructions,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
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
