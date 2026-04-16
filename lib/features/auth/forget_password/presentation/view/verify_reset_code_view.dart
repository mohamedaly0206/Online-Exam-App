import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/utilities/functions/show_snack_bar.dart';
import '../view_model/cubit/forget_password_cubit.dart';
import '../widgets/custom_otp_text_field.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key, required this.onSuccess});
  final VoidCallback onSuccess;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listenWhen: (previous, current) {
          return previous.verifyResetCodeState !=
                  current.verifyResetCodeState ||
              previous.resendOTPState != current.resendOTPState;
        },
        listener: (context, state) {
          if (state.verifyResetCodeState.data == true) {
            onSuccess();
          } else if (state.verifyResetCodeState.errorMessage != '' &&
              state.verifyResetCodeState.isLoading == false) {
            showSnackBar(
              context: context,
              message: state.verifyResetCodeState.errorMessage ?? '',
              color: theme.colorScheme.error,
            );
          } else if (state.resendOTPState.errorMessage != '' &&
              state.resendOTPState.isLoading == false) {
            showSnackBar(
              context: context,
              message: state.resendOTPState.errorMessage ?? '',
              color: theme.colorScheme.error,
            );
          }
        },
        buildWhen: (previous, current) {
          return previous.verifyResetCodeState !=
                  current.verifyResetCodeState ||
              previous.resendOTPState != current.resendOTPState;
        },
        builder: (context, state) {
          return Column(
            children: [
              Text(
                AppStrings.emailVerification,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.enterCode,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 24),
              state.verifyResetCodeState.isLoading
                  ? CircularProgressIndicator(color: theme.colorScheme.primary)
                  : CustomOTPTextField(
                      state: state,
                      onSubmit: (otp) {
                        cubit.doIntent(VerifyResetCodeIntent(otp: otp));
                      },
                    ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.verifyButton),
                  state.resendOTPState.isLoading
                      ? CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        )
                      : TextButton(
                          child: Text(AppStrings.resendButton),
                          onPressed: () {
                            cubit.doIntent(ResendOTPIntent());
                          },
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}