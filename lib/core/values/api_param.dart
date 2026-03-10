import 'package:online_exam_app/core/values/constants.dart';

class ApiParam {
  static const String getSubjectExams = '$baseUrl/exams?subject=';
  static const String getAllExamQuestions = '$baseUrl/questions?exam=';
  static const String email = 'email';
  static const String resetCode = 'resetCode';
  static const String newPassword = 'newPassword';
}
