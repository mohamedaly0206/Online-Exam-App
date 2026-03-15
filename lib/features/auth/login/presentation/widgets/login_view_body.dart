import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import '../view_model/cubit/login_cubit.dart';
import '../view_model/intent/login_intent.dart';
import '../view_model/state/login_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>(); // = bloc provider.of(context)

    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return previous.loginState.data != current.loginState.data ||
            previous.loginState.errorMessage !=
                current.loginState.errorMessage ||
            previous.loginState.isLoading != current.loginState.isLoading;
      },
      listener: (context, state) {
        final loginState = state.loginState;
        if (loginState.data != null && loginState.isLoading == false) {
          showSnackBar(
            context: context,
            message: AppStrings.loginSuccessfully,
            color: Theme.of(context).primaryColor,
          );
        } else if (loginState.errorMessage != null &&
            loginState.isLoading == false) {
          showSnackBar(
            context: context,
            message: loginState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
        }
      },

      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: cubit.emailController,
                  validator: (value) => AppValidators.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.hintEmailText,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  controller: cubit.passwordController,
                  validator: (value) => AppValidators.validatePassword(value),
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    hintText: AppStrings.hintPasswordText,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: cubit.rememberMe,
                      onChanged: (value) {
                        setState(() {
                          cubit.rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(
                      AppStrings.rememberMe,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        foregroundColor: Theme.of(context).colorScheme.onSurface,
                      ),
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgetPassword,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  child: state.loginState.isLoading
                      ?  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                      : const Text(AppStrings.login),
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.handleLoginIntent(LoginSubmitIntent());
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: Text(
                        AppStrings.signUp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
