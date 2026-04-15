class VerifyResetCodeRequest {
  final String code;

  VerifyResetCodeRequest({
    required this.code,
  });
  Map<String, dynamic> toJson() {
    return {
      'resetCode': code,
    };
  }
}