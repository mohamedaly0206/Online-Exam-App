import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/enter_email_view.dart';
import '../view/reset_password_view.dart';
import '../view/verify_reset_code_view.dart';
import '../view_model/cubit/forget_password_cubit.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PageView(
        controller: context.read<ForgetPasswordCubit>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          EnterEmailView(),
          VerifyResetCodeView(),
          ResetPasswordView(),
        ],
      ),
    );
  }
}
