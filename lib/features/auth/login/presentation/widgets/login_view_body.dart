import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../../../../../core/router/router_paths.dart';
import '../view_model/cubit/login_cubit.dart';
import '../view_model/intent/login_intent.dart';
import '../view_model/state/login_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginState != current.loginState,
      listener: (context, state) {
        final loginState = state.loginState;
        if (loginState.data != null && !loginState.isLoading) {
          showSnackBar(
            context: context,
            message: AppStrings.loginSuccessfully,
            color: Theme.of(context).primaryColor,
          );
          GoRouter.of(context).go(AppRouterPaths.kHomePageView);
        } else if (loginState.errorMessage != null && !loginState.isLoading) {
          showSnackBar(
            context: context,
            message: loginState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  validator: (value) => AppValidators.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.hintEmailText,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) =>
                      AppValidators.validateEmptyTextFormField(value),
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    hintText: AppStrings.hintPasswordText,
                    errorMaxLines: 3,
                  ),
                ),
                Row(
                  children: [
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.rememberMe != current.rememberMe,
                      builder: (context, state) {
                        return Checkbox(
                          value: state.rememberMe,
                          onChanged: (value) {
                            cubit.toggleRememberMe(value ?? false);
                          },
                        );
                      },
                    ),
                    Text(
                      AppStrings.rememberMe,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(decoration: TextDecoration.underline),
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onSurface,
                      ),
                      onPressed: () {},
                      child: const Text(AppStrings.forgetPassword),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.loginState.isLoading !=
                        current.loginState.isLoading,
                    builder: (context, state) {
                      return ElevatedButton(
                        child: state.loginState.isLoading
                            ? CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.onPrimary,
                              )
                            : const Text(AppStrings.login),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.handleLoginIntent(
                              LoginSubmitIntent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(decoration: TextDecoration.underline),
                      ),
                      child: const Text(AppStrings.signUp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
