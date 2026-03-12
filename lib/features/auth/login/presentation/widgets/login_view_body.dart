import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../view_model/cubit/cubit.dart';
import '../view_model/intent/login_intent.dart';
import '../view_model/state/state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>(); // = bloc provider.of(context)

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginState.errorMessage != null) {
          showSnackBar(
            context: context,
            message: '${state.loginState.errorMessage}',
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  validator: (value) => AppValidators.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) => AppValidators.validatePassword(value),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 48),
                state.loginState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.handleLoginIntent(
                              LoginSubmitIntent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
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
