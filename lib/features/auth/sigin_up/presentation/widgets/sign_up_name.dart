import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({
    super.key,
  });

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
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.lastName),
              hintText: AppStrings.hintLastNameText,
            ),
          ),
        ),
      ],
    );
  }
}


