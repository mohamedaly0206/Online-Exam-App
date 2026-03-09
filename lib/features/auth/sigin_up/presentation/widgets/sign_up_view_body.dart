import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/already_have_an_account.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/sign_up_name.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/sign_up_password.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AppStrings.userName),
                hintText: AppStrings.hintUserNameText,
              ),
            ),
            const SizedBox(height: 24),
            const SignUpName(),
            const SizedBox(height: 24),

            TextFormField(
              decoration: const InputDecoration(
                label: Text(AppStrings.email),
                hintText: AppStrings.hintEmailText,
              ),
            ),
            const SizedBox(height: 24),
            SignUpPassword(),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AppStrings.phone),
                hintText: AppStrings.hintPhoneText,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppStrings.signUpbutton),
            ),
            const SizedBox(height: 16),
            const AlreadyHaveAnAcoount(),
          ],
        ),
      ),
    );
  }
}
