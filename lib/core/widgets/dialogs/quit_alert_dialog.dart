import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuitAlertDialog extends StatelessWidget {
  const QuitAlertDialog({
    this.posButtonColor,
    super.key,
    required this.onPositivePressed,
    required this.title,
    required this.contentMessage,
    required this.positiveButtonText,
    required this.negativeButtonText,
  });
  final String title;
  final String contentMessage;
  final String positiveButtonText;
  final String negativeButtonText;
  final void Function()? onPositivePressed;
  final Color? posButtonColor;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      content: Text(contentMessage),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    posButtonColor != null
                        ? Theme.of(context).colorScheme.onPrimary
                        : null,
                  ),
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: Text(
                  negativeButtonText,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: posButtonColor != null
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    posButtonColor ?? Theme.of(context).colorScheme.error,
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(
                      color:
                          posButtonColor ?? Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                onPressed: onPositivePressed,
                child: Text(positiveButtonText),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
