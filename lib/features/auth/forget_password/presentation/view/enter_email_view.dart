import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/intent/forget_password_intent.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';
import '../../../../../core/values/app_strings.dart';

class EnterEmailView extends StatelessWidget {
  const EnterEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Form(
        key: cubit.enterEmailFormKey,
        child: Column(
          children: [
            Text(AppStrings.forgetPassword, style: theme.textTheme.titleMedium),
            SizedBox(height: 10),
            Text(
              AppStrings.enterEmail,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.email,
                hintText: AppStrings.hintEmailText,
              ),
              validator: (value) => AppValidators.validateEmail(value),
              controller: cubit.enterEmailTextController,
            ),
            SizedBox(height: 48),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    cubit.doIntent(EnterEmailIntent(context: context));
                  },
                  child: state.enterEmailState.isLoading
                      ? CircularProgressIndicator(
                          color: theme.colorScheme.onPrimary,
                        )
                      : Text(AppStrings.continueButton),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
