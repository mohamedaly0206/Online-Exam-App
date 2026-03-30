class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String login = '$baseUrl/auth/signin';
  static const String signUp = '$baseUrl/auth/signup';
  static const String changePassword = '$baseUrl/auth/changePassword';
  static const String deleteAccount = '$baseUrl/auth/deleteMe';
  static const String logout = '$baseUrl/auth/logout';
  static const String forgetPassword = '$baseUrl/auth/forgotPassword';
  static const String verifyResetPassword = '$baseUrl/auth/verifyResetCode';
  static const String resetPassword = '$baseUrl/auth/resetPassword';
  static const String getLoggedUserInfo = '$baseUrl/auth/profileData';
  static const String editProfile = '$baseUrl/auth/editProfile';
  static const String getAllSubjects = '$baseUrl/subjects';
}
