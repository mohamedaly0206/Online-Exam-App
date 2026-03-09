import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class SignUpPassword extends StatelessWidget {
  const SignUpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              label: Text(AppStrings.password),
              hintText: AppStrings.hintPasswordSignUpText,
            ),
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              label: Text(AppStrings.confirmPassword),
              hintText: AppStrings.hintConfirmPasswordText,
            ),
          ),
        ),
      ],
    );
  }
}
