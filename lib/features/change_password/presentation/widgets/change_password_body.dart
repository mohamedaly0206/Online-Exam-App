import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/change_password/presentation/cubit/change_password_cubit.dart';

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
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
       if (!state.changePasswordState.isLoading &&
    state.changePasswordState.data != null) {
          clearForm();
          // GoRouter.of(context).pop();
          showSnackBar(
            context: context,
            message: AppStrings.successChangePassword,
            color: Theme.of(context).colorScheme.primary,
          );
        } else if (state.changePasswordState.errorMessage != null) {
          showSnackBar(
            context: context,
            message: state.changePasswordState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
        }
      },
      child: Padding(
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
                  if (formKey.currentState!.validate()) {
                    if (formKey.currentState!.validate()) {
                      context.read<ChangePasswordCubit>().changePassword(
                        currentPasswordController.text,
                        newPasswordController.text,
                        confirmPasswordController.text,
                      );
                    }
                  }
                },
                child: const Text(AppStrings.updateButton),
              ),
            ],
          ),
        ),
      ),
       listenWhen: (previous, current) =>
      previous.changePasswordState != current.changePasswordState,
    );
  }

  void clearForm() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    formKey.currentState!.reset();
  }
}
