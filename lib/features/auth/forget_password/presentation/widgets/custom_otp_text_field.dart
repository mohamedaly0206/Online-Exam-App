import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam_app/core/theme/app_text_styles.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import '../view_model/cubit/forget_password_cubit.dart';
import '../view_model/state/forget_password_event.dart';

class CustomOTPTextField extends StatelessWidget {
  const CustomOTPTextField({super.key, this.errorMessage});
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        OtpTextField(
          numberOfFields: 6,
          fieldWidth: 46,
          contentPadding: EdgeInsets.all(2),
          margin: EdgeInsetsGeometry.all(4),
          showFieldAsBox: true,
          autoFocus: true,
          filled: true,
          cursorColor: Theme.of(context).colorScheme.primary,
          focusedBorderColor: errorMessage == null
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.error,
          styles: AppTextStyles.otpTextStyle,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          enabledBorderColor: errorMessage == null
              ? Theme.of(context).colorScheme.primary.withOpacity(.2)
              : Theme.of(context).colorScheme.error,
          fillColor: Theme.of(context).colorScheme.primary.withOpacity(.2),

          onSubmit: (value) {
            context.read<ForgetPasswordCubit>().doEvent(
              VerifyResetCodeEvent(context: context, otp: value),
            );
          },
        ),
        errorMessage == null
            ? SizedBox()
            : Text(
                AppStrings.invalidCode,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
      ],
    );
  }
}
