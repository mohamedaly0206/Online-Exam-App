import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class ScoreViewBodyButtons extends StatelessWidget {
  const ScoreViewBodyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(AppStrings.showResultButton),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          style: ElevatedButton.styleFrom().copyWith(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          onPressed: () {
            GoRouter.of(
              context,
            ).pushReplacement(AppRouterPaths.kExamQuestionsView);
          },
          child: Text(
            AppStrings.startAgain,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
