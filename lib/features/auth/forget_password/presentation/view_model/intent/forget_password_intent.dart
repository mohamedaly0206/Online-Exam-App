import 'package:flutter/material.dart';

sealed class ForgetPasswordIntent {}

class EnterEmailIntent extends ForgetPasswordIntent {
  final BuildContext context;

  EnterEmailIntent({required this.context});
}

class ResendOTPIntent extends ForgetPasswordIntent {
  final BuildContext context;

  ResendOTPIntent({required this.context});
}

class ResetPasswordIntent extends ForgetPasswordIntent {
  final BuildContext context;

  ResetPasswordIntent({required this.context});
}

class VerifyResetCodeIntent extends ForgetPasswordIntent {
  final BuildContext context;
  final String otp;

  VerifyResetCodeIntent({required this.context, required this.otp});
}

class BackToPriviesPageIntent extends ForgetPasswordIntent {
  final BuildContext context;

  BackToPriviesPageIntent({required this.context});
}
