import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_event.dart';
import '../../../../../core/values/app_strings.dart';

class EnterEmailView extends StatelessWidget {
  const EnterEmailView({super.key,});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<ForgetPasswordCubit>().enterEmailFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                AppStrings.forgetPassword,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.enterEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  hintText: AppStrings.hintEmailText,
                ),
                validator: (value) => AppValidators.validateEmail(value),
                controller: context
                    .read<ForgetPasswordCubit>()
                    .enterEmailTextController,
              ),
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  context.read<ForgetPasswordCubit>().doEvent(
                    EnterEmailEvent(context: context),
                  );
                },
                child: Text(AppStrings.continueButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
