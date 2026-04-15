import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/values/app_strings.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final cubit = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Form(
        key: cubit.resetPasswordFormKey,
        child: Column(
          children: [
            Text(AppStrings.resetPassword, style: theme.textTheme.titleMedium),
            SizedBox(height: 10),
            Text(
              AppStrings.resetPasswordHint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.newPassword,
                hintText: AppStrings.hintPasswordText,
              ),
              obscureText: true,
              validator: (value) => AppValidators.validatePassword(value),
              controller: cubit.passwordTextController,
            ),
            SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.hintConfirmPasswordText,
              ),
              obscureText: true,
              validator: (value) => AppValidators.confirmPassword(
                cubit.passwordTextController.text,
                value,
              ),
              controller: cubit.confirmPasswordTextController,
            ),
            SizedBox(height: 48),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              buildWhen: (previous, current) {
                return previous.resetPasswordState.isLoading !=
                        current.resetPasswordState.isLoading ||
                    previous.resetPasswordState.errorMessage !=
                        current.resetPasswordState.errorMessage ||
                    previous.resetPasswordState.data !=
                        current.resetPasswordState.data;
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    cubit.doIntent(ResetPasswordIntent(context: context));
                  },
                  child: state.resetPasswordState.isLoading
                      ? CircularProgressIndicator(
                          color: theme.colorScheme.onPrimary,
                        )
                      : Text(AppStrings.continueButton),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
