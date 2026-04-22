import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class ChangePasswordBody extends StatelessWidget {
  ChangePasswordBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: currentPasswordController,
              decoration: const InputDecoration(
                label: Text(AppStrings.hintcurrentPassword),
                hintText: AppStrings.hintcurrentPassword,
              ),
              validator: (value) =>
                  AppValidators.validateEmptyTextFormField(value),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                label: Text(AppStrings.hintNewPassword),
                hintText: AppStrings.hintNewPassword,
              ),
              validator: (value) => AppValidators.validatePassword(value),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                label: Text(AppStrings.confirmPassword),
                hintText: AppStrings.hintConfirmPasswordText,
              ),
              validator: (value) => AppValidators.confirmPassword(
                newPasswordController.text,
                value,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: const Text(AppStrings.updateButton),
            ),
          ],
        ),
      ),
    );
  }
}
