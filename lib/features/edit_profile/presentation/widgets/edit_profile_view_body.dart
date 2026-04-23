import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../../../../core/utilities/app_validators.dart';
import '../view_model/cubit/edit_profile_cubit.dart';
import '../view_model/intent/edit_profile_intent.dart';
import '../view_model/state/edit_profile_state.dart';

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
    _passwordController.text = '********';
    _userNameController.addListener(_checkInputs);
    _firstNameController.addListener(_checkInputs);
    _lastNameController.addListener(_checkInputs);
    _emailController.addListener(_checkInputs);
    _phoneController.addListener(_checkInputs);
  }

  void _checkInputs() {
    final state = context.read<EditProfileCubit>().state;
    // data in cubit
    final user = state.editProfileState.data;

    if (user == null) {
      setState(() => _isButtonEnabled = false);
      return;
    }

    bool isChanged =
        _userNameController.text != (user.userName) ||
        _firstNameController.text != (user.firstName) ||
        _lastNameController.text != (user.lastName) ||
        _emailController.text != (user.email) ||
        _phoneController.text != (user.phone);

    setState(() {
      _isButtonEnabled = isChanged;
    });
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
    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) {
        return (previous.editProfileState.data == null &&
                current.editProfileState.data != null) ||
            (previous.editProfileState.isLoading !=
                current.editProfileState.isLoading) ||
            (previous.editProfileState.errorMessage !=
                current.editProfileState.errorMessage);
      },
      listener: (context, state) {
        final user = state.editProfileState.data;
        final errorMessage = state.editProfileState.errorMessage;
        final isLoading = state.editProfileState.isLoading;

        if (!isLoading && errorMessage == null && user != null) {
          if (_userNameController.text.isEmpty) {
            _userNameController.text = user.userName;
            _firstNameController.text = user.firstName;
            _lastNameController.text = user.lastName;
            _emailController.text = user.email;
            _phoneController.text = user.phone;
            _checkInputs();
          } else if (_isButtonEnabled) {
            showSnackBar(
              context: context,
              message: AppStrings.profileUpdatedSuccessfully,
              color: Theme.of(context).colorScheme.tertiary,
            );
            _checkInputs();
          }
        }

        if (errorMessage != null && !isLoading) {
          showSnackBar(
            context: context,
            message: state.editProfileState.errorMessage!,
            color: Theme.of(context).colorScheme.error,
          );
        }
      },
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                            decoration: const BoxDecoration(
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
                              color: Theme.of(
                                context,
                              ).colorScheme.onSecondaryFixed,
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              label: Text(AppStrings.lastName),
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
                      ),
                      validator: (value) => (value == null || value.isEmpty)
                          ? null
                          : AppValidators.validateEmail(value),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            onPressed: () {},
                            child: const Text(AppStrings.change),
                          ),
                        ),
                        label: const Text(AppStrings.password),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        label: Text(AppStrings.phone),
                      ),
                      validator: (value) => (value == null || value.isEmpty)
                          ? null
                          : AppValidators.validatePhoneNumber(value),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(side: BorderSide.none),
                      onPressed:
                          (_isButtonEnabled &&
                              !state.editProfileState.isLoading)
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.read<EditProfileCubit>().processIntent(
                                  SubmitEditProfileIntent(
                                    username: _userNameController.text,
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    email: _emailController.text,
                                    phone: _phoneController.text,
                                  ),
                                );
                              }
                            }
                          : null,
                      child: state.editProfileState.isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              AppStrings.updateButton,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                  ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
