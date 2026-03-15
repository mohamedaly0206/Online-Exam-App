import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/values/app_strings.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        buildWhen: (previous, current) {
          return previous.resetPasswordState.isLoading !=
                  current.resetPasswordState.isLoading ||
              previous.resetPasswordState.errorMessage !=
                  current.resetPasswordState.errorMessage ||
              previous.resetPasswordState.data !=
                  current.resetPasswordState.data;
        },
        builder: (context, state) {
          return Form(
            key: context.read<ForgetPasswordCubit>().resetPasswordFormKey,
            child: Column(
              children: [
                Text(
                  AppStrings.resetPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.resetPasswordHint,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 32),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.newPassword,
                    hintText: AppStrings.hintPasswordText,
                  ),
                  validator: (value) => AppValidators.validatePassword(value),
                  controller: context
                      .read<ForgetPasswordCubit>()
                      .passwordTextController,
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    hintText: AppStrings.hintConfirmPasswordText,
                  ),
                  validator: (value) => AppValidators.confirmPassword(
                    context
                        .read<ForgetPasswordCubit>()
                        .passwordTextController
                        .text,
                    value,
                  ),
                  controller: context
                      .read<ForgetPasswordCubit>()
                      .confirmPasswordTextController,
                ),
                SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    context.read<ForgetPasswordCubit>().doIntent(
                      ResetPasswordIntent(context: context),
                    );
                  },
                  child: state.resetPasswordState.isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : Text(AppStrings.continueButton),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
