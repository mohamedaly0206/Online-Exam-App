sealed class ForgetPasswordIntent {}

class EnterResetEmailIntent extends ForgetPasswordIntent {
  final String email;

  EnterResetEmailIntent({required this.email});
}

class ResendOTPIntent extends ForgetPasswordIntent {
  ResendOTPIntent();
}

class ResetPasswordIntent extends ForgetPasswordIntent {
  final String newPassword;

  ResetPasswordIntent({required this.newPassword});
}

class VerifyResetCodeIntent extends ForgetPasswordIntent {
  final String otp;

  VerifyResetCodeIntent({required this.otp});
}
