import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';

class SignUpPassword extends StatelessWidget {
  const SignUpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpCubit signUpCubit = context.read<SignUpCubit>();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.password),
              hintText: AppStrings.hintPasswordSignUpText,
              errorMaxLines: 3,
            ),
            controller: signUpCubit.passwordController,
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
            controller: signUpCubit.confirmPasswordController,
            validator: (value) => AppValidators.confirmPassword(
              signUpCubit.passwordController.text,
              value,
            ),
          ),
        ),
      ],
    );
  }
}
