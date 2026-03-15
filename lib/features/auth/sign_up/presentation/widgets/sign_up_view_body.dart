import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/request/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/intent/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/state/sigin_up_state.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sigin_up_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/already_have_an_account.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/sign_up_name.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/sign_up_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.signUpState.data != null &&
            state.signUpState.data!.message != '') {
          showSnackBar(
            context: context,
            message: AppStrings.signUpSuccessMessage,
            color: Theme.of(context).colorScheme.primary,
          );
          state.signUpState.data!.message == '';
        } else if (state.signUpState.errorMessage != null) {
          showSnackBar(
            context: context,
            message: state.signUpState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
          state.signUpState.errorMessage = null;
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: context.read<SignUpCubit>().formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: signUpCubit.userNameController,
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
                  controller: signUpCubit.emailController,
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
                  controller: signUpCubit.phoneNumberController,
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
                      context.read<SignUpCubit>().handleSignUpIntent(
                        SubmitSignUp(
                          requestModel: SignUpRequestModel(
                            userName: signUpCubit.userNameController.text,
                            email: signUpCubit.emailController.text,
                            password: signUpCubit.passwordController.text,
                            confirmPassword:
                                signUpCubit.confirmPasswordController.text,
                            firstName: signUpCubit.firstNameController.text,
                            lastName: signUpCubit.lastNameController.text,
                            phoneNumber: signUpCubit.phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: signUpCubit.state.signUpState.isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : const Text(AppStrings.signUpButton),
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
