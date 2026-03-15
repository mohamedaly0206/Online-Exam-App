import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/enter_email_view.dart';
import '../view/reset_password_view.dart';
import '../view/verify_reset_code_view.dart';
import '../view_model/cubit/forget_password_cubit.dart';
import 'loading_progress_indicator.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({
    super.key,
    required this.isAnyLoading,
    this.verifyResetCodeErrorMessage,
  });

  final bool isAnyLoading;
  final String? verifyResetCodeErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: context.read<ForgetPasswordCubit>().pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            EnterEmailView(),
            VerifyResetCodeView(errorMessage: verifyResetCodeErrorMessage),
            ResetPasswordView(),
          ],
        ),
        if (isAnyLoading) LoadingProgressIndicator(),
      ],
    );
  }
}
