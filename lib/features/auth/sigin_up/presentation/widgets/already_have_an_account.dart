import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class AlreadyHaveAnAcoountWidget extends StatelessWidget {
  const AlreadyHaveAnAcoountWidget({super.key});

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
