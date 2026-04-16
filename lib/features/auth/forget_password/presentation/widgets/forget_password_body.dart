import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../view/enter_email_view.dart';
import '../view/reset_password_view.dart';
import '../view/verify_reset_code_view.dart';
import '../view_model/cubit/forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPageIndex < 2) {
      setState(() => currentPageIndex++);
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    } else {
      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          EnterEmailView(onSuccess: nextPage),
          VerifyResetCodeView(onSuccess: nextPage),
          ResetPasswordView(onSuccess: nextPage),
        ],
      ),
    );
  }
}
