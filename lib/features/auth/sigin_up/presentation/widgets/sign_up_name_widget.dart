import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class SignUpNameWidget extends StatelessWidget {
  const SignUpNameWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.firstName),
              hintText: AppStrings.hintFirstNameText,
            ),
            controller: firstNameController,
            validator: (value) =>
                AppValidators.validateEmptyTextFormField(value),
            keyboardType: TextInputType.name,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.lastName),
              hintText: AppStrings.hintLastNameText,
            ),
            controller: lastNameController,
            validator: (value) =>
                AppValidators.validateEmptyTextFormField(value),
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}
