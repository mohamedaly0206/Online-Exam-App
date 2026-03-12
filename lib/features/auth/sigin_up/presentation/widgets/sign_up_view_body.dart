import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/models/request/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/view_model/state/sigin_up_state.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/view_model/cubit/sigin_up_view_model.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/already_have_an_account.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/sign_up_name.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/widgets/sign_up_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignUpCubit>();
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.signUpState.data != null &&
            state.signUpState.data!.message != '') {
          showSnackBar(
            context: context,
            message: state.signUpState.data!.message.toString(),
            color: Theme.of(context).colorScheme.primary,
          );
          state.signUpState.data!.message == '';
        } else if (state.signUpState.errorMessage != null) {
          showSnackBar(
            context: context,
            message: AppStrings.signUpSuccessMessage,
            color: Theme.of(context).colorScheme.error,
          );
          state.signUpState.errorMessage = null;
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: context.read<SignUpCubit>().formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: viewModel.userNameController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.userName),
                    hintText: AppStrings.hintUserNameText,
                  ),
                  validator: (value) =>
                      AppValidators.validateEmptyTextFormField(value),
                ),
                const SizedBox(height: 24),
                SignUpName(),
                const SizedBox(height: 24),

                TextFormField(
                  controller: viewModel.emailController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.email),
                    hintText: AppStrings.hintEmailText,
                  ),
                  validator: (value) => AppValidators.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                SignUpPassword(),
                const SizedBox(height: 24),
                TextFormField(
                  controller: viewModel.phoneNumberController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.phone),
                    hintText: AppStrings.hintPhoneText,
                  ),
                  validator: (value) =>
                      AppValidators.validatePhoneNumber(value),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignUpCubit>().signUp(
                        SignUpRequestModel(
                          userName: viewModel.userNameController.text,
                          firstName: viewModel.firstNameController.text,
                          lastName: viewModel.lastNameController.text,
                          email: viewModel.emailController.text,
                          password: viewModel.passwordController.text,
                          confirmPassword:
                              viewModel.confirmPasswordController.text,
                          phoneNumber: viewModel.phoneNumberController.text,
                        ),
                      );
                    }
                  },
                  child: Text(AppStrings.signUpbutton),
                ),
                const SizedBox(height: 16),
                const AlreadyHaveAnAcoount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
