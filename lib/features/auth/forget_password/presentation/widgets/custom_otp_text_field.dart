import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/auth/forget_password/presentation/view_model/state/forget_password_state.dart';

class CustomOTPTextField extends StatelessWidget {
  const CustomOTPTextField({
    super.key,
    required this.state,
    required this.onSubmit,
  });
  final ForgetPasswordState state;
  final Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
  final theme= Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        OtpTextField(
          numberOfFields: 6,
          fieldWidth: 46,
          contentPadding: EdgeInsets.all(2),
          margin: EdgeInsets.all(4),
          showFieldAsBox: true,
          autoFocus: true,
          filled: true,
          textStyle: theme.textTheme.headlineLarge,
          cursorColor: theme.colorScheme.primary,
          focusedBorderColor: state.verifyResetCodeState.errorMessage == null
              ? theme.colorScheme.primary
              : theme.colorScheme.error,
          // styles: AppTextStyles.otpTextStyle,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          enabledBorderColor: state.verifyResetCodeState.errorMessage == null
              ? theme.colorScheme.primaryFixed
              : theme.colorScheme.error,
          fillColor: theme.colorScheme.primaryFixed,

          onSubmit: onSubmit,
        ),
        state.verifyResetCodeState.errorMessage == null
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.icons.errorIcon,
                    color: theme.colorScheme.error,
                    width: 14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    AppStrings.invalidCode,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
