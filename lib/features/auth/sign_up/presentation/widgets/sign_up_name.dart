import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpCubit signUpCubit = context.read<SignUpCubit>();

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.firstName),
              hintText: AppStrings.hintFirstNameText,
              errorMaxLines: 3,
            ),
            controller: signUpCubit.firstNameController,
            validator: (value) =>
                AppValidators.validateName(value, AppStrings.firstName),
            keyboardType: TextInputType.name,
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.lastName),
              hintText: AppStrings.hintLastNameText,
              errorMaxLines: 3,
            ),
            controller: signUpCubit.lastNameController,
            validator: (value) =>
                AppValidators.validateName(value, AppStrings.lastName),
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}
