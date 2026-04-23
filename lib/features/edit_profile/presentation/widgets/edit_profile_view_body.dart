import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../../../../core/utilities/app_validators.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_checkInputs);
    _firstNameController.addListener(_checkInputs);
    _lastNameController.addListener(_checkInputs);
    _emailController.addListener(_checkInputs);
    _passwordController.addListener(_checkInputs);
    _phoneController.addListener(_checkInputs);
  }

  void _checkInputs() {
    bool allFieldsAreEmpty =
        _userNameController.text.isEmpty &&
        _firstNameController.text.isEmpty &&
        _lastNameController.text.isEmpty &&
        _emailController.text.isEmpty &&
        _passwordController.text.isEmpty &&
        _phoneController.text.isEmpty;
    if (allFieldsAreEmpty == true) {
      setState(() {
        _isButtonEnabled = false;
      });
    } else {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&iar=0&w=600&hash=833D605FDB6AC3C2D2915F6BF8B4ADA4',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondaryFixed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _userNameController,
              decoration: const InputDecoration(
                label: Text(AppStrings.userName),
                hintText: 'Enter your user name',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      label: Text(AppStrings.firstName),
                      hintText: 'Enter first name',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      label: Text(AppStrings.lastName),
                      hintText: 'Enter last name',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text(AppStrings.email),
                hintText: 'Enter your email',
              ),
              validator: (value) => (value == null || value.isEmpty)
                  ? null
                  : AppValidators.validateEmail(value),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              validator: (value) => (value == null || value.isEmpty)
                  ? null
                  : AppValidators.validatePassword(value),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.displayLarge
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    onPressed: () {},
                    child: Text(AppStrings.change),
                  ),
                ),
                label: Text(AppStrings.password),
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                label: Text(AppStrings.phone),
                hintText: 'Enter your phone number',
              ),
              validator: (value) => (value == null || value.isEmpty)
                  ? null
                  : AppValidators.validatePhoneNumber(value),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(side: BorderSide.none),
              onPressed: _isButtonEnabled
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data updated Successfully'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  : null,
              child: Text(
                AppStrings.updateButton,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
