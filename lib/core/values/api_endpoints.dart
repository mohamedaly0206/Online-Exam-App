import 'package:online_exam_app/core/values/constants.dart';

class ApiEndpoints {
  static const String login = '$baseUrl/auth/signin';
  static const String register = '$baseUrl/auth/signup';
  static const String changePassword = '$baseUrl/auth/changePassword';
  static const String deleteAccount = '$baseUrl/auth/deleteMe';
  static const String logout = '$baseUrl/auth/logout';
  static const String forgotPassword = '$baseUrl/auth/forgotPassword';
  static const String verfiyResetPassword = '$baseUrl/auth/verifyResetCode';
  static const String resetPassword = '$baseUrl/auth/resetPassword';
  static const String getLoggedUserInfo = '$baseUrl/auth/profileData';
  static const String editProfile = '$baseUrl/auth/editProfile';
}
