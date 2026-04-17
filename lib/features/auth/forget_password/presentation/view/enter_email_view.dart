import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/values/app_strings.dart';

class EnterEmailView extends StatelessWidget {
  const EnterEmailView({super.key, required this.onSuccess});
  final VoidCallback onSuccess;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    final theme = Theme.of(context);
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(AppStrings.forgetPassword, style: theme.textTheme.titleMedium),
            SizedBox(height: 10),
            Text(
              AppStrings.enterEmail,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.email,
                hintText: AppStrings.hintEmailText,
              ),
              validator: AppValidators.validateEmail,
              controller: emailController,
            ),
            SizedBox(height: 48),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listenWhen: (prev, current) =>
                  prev.enterEmailState != current.enterEmailState,
              listener: (context, state) {
                if (state.enterEmailState.data == true) {
                  onSuccess();
                } else if (state.enterEmailState.errorMessage != '' &&
                    state.enterEmailState.isLoading == false) {
                  showSnackBar(
                    context: context,
                    message: state.enterEmailState.errorMessage ?? '',
                    color: theme.colorScheme.error,
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.enterEmailState.isLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            cubit.doIntent(
                              EnterResetEmailIntent(
                                email: emailController.text,
                              ),
                            );
                          }
                        },
                  child: state.enterEmailState.isLoading
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
