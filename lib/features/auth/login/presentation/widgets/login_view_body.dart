import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_text_styles.dart';
import 'package:online_exam_app/core/utilities/app_validators.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});


  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Login', style: AppTextStyles.textStyleMedium20),
            const SizedBox(height: 24),
            TextFormField(
              validator: (value){
                return AppValidators.validateEmail(value);
              },
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.secondaryColor),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              validator: (value){
                return AppValidators.validatePassword(value);
              },
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColors.secondaryColor),
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                Text(
                  'Remember me',
                  style: AppTextStyles.textStyleRegular13.copyWith(
                    fontFamily: AppTextStyles.fontFamily,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0,
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Forget password?',
                    style: AppTextStyles.textStyleRegular12.copyWith(
                      color: Colors.black,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            ElevatedButton(child: Text('Login'), onPressed: () {
              if(_formKey.currentState!.validate()){
                print('Login Successfully');
              }
            }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: AppTextStyles.textStyleMedium16,
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: AppTextStyles.textStyleMedium16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
