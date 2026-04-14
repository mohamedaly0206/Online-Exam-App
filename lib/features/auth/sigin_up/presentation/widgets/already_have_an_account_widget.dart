import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(onPressed: () {}, child: Text(AppStrings.login)),
      ],
    );
  }
}
