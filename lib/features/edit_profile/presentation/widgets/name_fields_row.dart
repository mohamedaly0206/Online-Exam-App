import 'package:flutter/material.dart';

import '../../../../core/values/app_strings.dart';

class NameFieldsRow extends StatelessWidget {
  const NameFieldsRow({
    super.key,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
  }) : _firstNameController = firstNameController,
       _lastNameController = lastNameController;

  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              label: Text(AppStrings.firstName),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(label: Text(AppStrings.lastName)),
          ),
        ),
      ],
    );
  }
}
