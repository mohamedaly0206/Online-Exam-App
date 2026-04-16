import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/values/app_strings.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.onSuccess});
  final VoidCallback onSuccess;
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<ForgetPasswordCubit>();
    final theme = Theme.of(context);

    final formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
              validator: AppValidators.validatePassword,
              controller: passwordController,
            ),
            SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.hintConfirmPasswordText,
              ),
              obscureText: true,
              validator: (value) =>
                  AppValidators.confirmPassword(passwordController.text, value),
              controller: confirmPasswordController,
            ),
            SizedBox(height: 48),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              buildWhen: (previous, current) {
                return previous.resetPasswordState !=
                    current.resetPasswordState;
              },
              listenWhen: (previous, current) {
                return previous.resetPasswordState !=
                    current.resetPasswordState;
              },
              listener: (context, state) {
                if (state.resetPasswordState.data == true) {
                  onSuccess();
                } else if (state.resetPasswordState.errorMessage != '' &&
                    state.resetPasswordState.isLoading == false) {
                  showSnackBar(
                    context: context,
                    message: state.resetPasswordState.errorMessage ?? '',
                    color: theme.colorScheme.error,
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.resetPasswordState.isLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            cubit.doIntent(
                              ResetPasswordIntent(
                                newPassword: passwordController.text,
                              ),
                            );
                          }
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
