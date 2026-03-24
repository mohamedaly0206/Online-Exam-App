import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class AlreadyHaveAnAcoount extends StatelessWidget {
  const AlreadyHaveAnAcoount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(AppStrings.login),
        ),
      ],
    );
  }
}
