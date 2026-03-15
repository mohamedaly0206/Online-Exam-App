import 'package:flutter/material.dart';

sealed class ForgetPasswordEvent {}

class EnterEmailEvent extends ForgetPasswordEvent {
  final BuildContext context;

  EnterEmailEvent({required this.context});
}
class ResendOTPEvent extends ForgetPasswordEvent {
  final BuildContext context;

  ResendOTPEvent({required this.context});
}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final BuildContext context;

  ResetPasswordEvent({required this.context});
}

class VerifyResetCodeEvent extends ForgetPasswordEvent {
  final BuildContext context;
  final String otp;

  VerifyResetCodeEvent({required this.context, required this.otp});
}

class BackToPriviesPageEvent extends ForgetPasswordEvent {
  final BuildContext context;

  BackToPriviesPageEvent({required this.context});
}

