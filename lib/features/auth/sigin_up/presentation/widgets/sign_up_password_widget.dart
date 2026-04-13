import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class SignUpPasswordWidget extends StatelessWidget {
  const SignUpPasswordWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.password),
              hintText: AppStrings.hintPasswordSignUpText,
              errorMaxLines: 3,
            ),
            controller: passwordController,
            validator: (value) => AppValidators.validatePassword(value),
            obscureText: true,
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
            controller: confirmPasswordController,
            validator: (value) =>
                AppValidators.confirmPassword(passwordController.text, value),
          ),
        ),
      ],
    );
  }
}
