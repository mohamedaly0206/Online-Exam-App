import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/dialogs/quit_alert_dialog.dart';

Future<void> showQuitExamDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => QuitAlertDialog(
      posButtonColor: Theme.of(context).colorScheme.error,
      title: AppStrings.exitExam,
      contentMessage: AppStrings.exitExamMessage,
      negativeButtonText: AppStrings.no,
      positiveButtonText: AppStrings.yes,
      onPositivePressed: () {
        GoRouter.of(context).pop();
        GoRouter.of(context).go(AppRouterPaths.kHomeView);
      },
    ),
  );
}

Future<void> showFinishDialog(
  BuildContext context,
  void Function() onPositivePressed,
) {
  return showDialog(
    context: context,
    builder: (context) => QuitAlertDialog(
      onPositivePressed: onPositivePressed,
      posButtonColor: Theme.of(context).colorScheme.primary,
      title: AppStrings.finishExam,
      contentMessage: AppStrings.finishExamMessage,
      positiveButtonText: AppStrings.viewScore,
      negativeButtonText: AppStrings.cancel,
    ),
  );
}
