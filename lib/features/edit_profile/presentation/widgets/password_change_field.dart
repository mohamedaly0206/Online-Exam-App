import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import '../../../../core/values/app_strings.dart';

class PasswordChangeField extends StatelessWidget {
  const PasswordChangeField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouterPaths.kChangePasswordView);
            },
            child: const Text(AppStrings.change),
          ),
        ),
        label: const Text(AppStrings.password),
      ),
    );
  }
}
