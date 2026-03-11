import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/view_model/sigin_up_view_model.dart';

class SignUpPassword extends StatelessWidget {
  const SignUpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpViewModel signUpViewModel = context.read<SignUpViewModel>();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.password),
              hintText: AppStrings.hintPasswordSignUpText,
              errorMaxLines: 3,
            ),
            controller: signUpViewModel.passwordController,
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
            controller: signUpViewModel.confirmPasswordController,
            validator: (value) => AppValidators.confirmPassword(
              signUpViewModel.passwordController.text,
              value,
            ),
          ),
        ),
      ],
    );
  }
}
