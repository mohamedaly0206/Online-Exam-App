import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';

import '../../../../../core/utilities/functions/show_snack_bar.dart';
import '../view_model/cubit/forget_password_cubit.dart';
import '../widgets/custom_otp_text_field.dart';

class VerifyResetCodeView extends StatelessWidget {
  VerifyResetCodeView({super.key});
  final cubit = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listenWhen: (previous, current) {
          return previous.verifyResetCodeState.errorMessage !=
                  current.verifyResetCodeState.errorMessage ||
              previous.resendOTPState.errorMessage !=
                  current.resendOTPState.errorMessage;
        },
        listener: (context, state) {
          if (state.verifyResetCodeState.errorMessage != null) {
            showSnackBar(
              context: context,
              message: state.verifyResetCodeState.errorMessage ?? '',
              color: theme.colorScheme.error,
            );
          } else if (state.resendOTPState.errorMessage != null) {
            showSnackBar(
              context: context,
              message: state.resendOTPState.errorMessage ?? '',
              color: theme.colorScheme.error,
            );
          }
        },
        buildWhen: (previous, current) {
          return
          // changes on verify otp state
          (previous.verifyResetCodeState.isLoading !=
                      current.verifyResetCodeState.isLoading ||
                  previous.verifyResetCodeState.errorMessage !=
                      current.verifyResetCodeState.errorMessage ||
                  previous.verifyResetCodeState.data !=
                      current.verifyResetCodeState.data)
              // changes on resend otp state
              ||
              (previous.resendOTPState.isLoading !=
                      current.resendOTPState.isLoading ||
                  previous.resendOTPState.errorMessage !=
                      current.resendOTPState.errorMessage ||
                  previous.resendOTPState.data != current.resendOTPState.data);
        },
        builder: (context, state) {
          return Form(
            key: cubit.verifyResetCodeFormKey,
            child: Column(
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
                    ? CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                      )
                    : CustomOTPTextField(state: state),
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
                              cubit.doIntent(ResendOTPIntent(context: context));
                            },
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
