class ApiEndpoints {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String login = '$baseUrl/auth/signin';
  static const String signUp = '$baseUrl/auth/signup';
  static const String changePassword = '$baseUrl/auth/changePassword';
  static const String deleteAccount = '$baseUrl/auth/deleteMe';
  static const String logout = '$baseUrl/auth/logout';
  static const String forgotPassword = '$baseUrl/auth/forgotPassword';
  static const String verfiyResetPassword = '$baseUrl/auth/verifyResetCode';
  static const String resetPassword = '$baseUrl/auth/resetPassword';
  static const String getLoggedUserInfo = '$baseUrl/auth/profileData';
  static const String editProfile = '$baseUrl/auth/editProfile';
}
