import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/request/sign_up_request_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/intent/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/state/sign_up_state.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/already_have_an_account.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/sign_up_name_widget.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/widgets/sign_up_password_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.signUpState.data != null &&
            state.signUpState.data!.message!.isNotEmpty) {
          showSnackBar(
            context: context,
            message: AppStrings.signUpSuccessMessage,
            color: Theme.of(context).colorScheme.primary,
          );
          clearForm();
          GoRouter.of(context).pop();
        } else if (state.signUpState.errorMessage != null &&
            state.signUpState.isLoading == false) {
          showSnackBar(
            context: context,
            message: state.signUpState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.userName),
                    hintText: AppStrings.hintUserNameText,
                  ),
                  validator: (value) =>
                      AppValidators.validateEmptyTextFormField(value),
                ),
                const SizedBox(height: 24),
                SignUpNameWidget(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.email),
                    hintText: AppStrings.hintEmailText,
                  ),
                  validator: (value) => AppValidators.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                SignUpPasswordWidget(
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    label: Text(AppStrings.phone),
                    hintText: AppStrings.hintPhoneText,
                  ),
                  validator: (value) =>
                      AppValidators.validatePhoneNumber(value),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 48),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignUpCubit>().handleSignUpIntent(
                            SubmitSignUp(
                              requestModel: SignUpRequestEntity(
                                userName: userNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                confirmPassword: confirmPasswordController.text
                                    .trim(),
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                phoneNumber: phoneNumberController.text.trim(),
                              ),
                            ),
                          );
                        }
                      },
                      child: state.signUpState.isLoading
                          ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )
                          : const Text(AppStrings.signUpButton),
                    );
                  },
                ),

                const SizedBox(height: 16),
                const AlreadyHaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearForm() {
    userNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    formKey.currentState!.reset();
  }
}
