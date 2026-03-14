import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_event.dart';

import '../view_model/cubit/forget_password_cubit.dart';
import '../widgets/custom_otp_text_field.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key,  this.errorMessage});
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<ForgetPasswordCubit>().verifyResetCodeFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                AppStrings.emailVerification,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.enterCode,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24),
              if (errorMessage != null)
                CustomOTPTextField(
                  errorMessage:
                      errorMessage,
                ),
              if (errorMessage == null)
                CustomOTPTextField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.verifyButton),
                  TextButton(
                    child: Text(AppStrings.resendButton),
                    onPressed: () {
                      context.read<ForgetPasswordCubit>().doEvent(
                        ResendOTPEvent(context: context),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
