import 'package:online_exam_app/core/values/constants.dart';

class ApiParam {
  static const String getSubjectExams =
      '$baseUrl/exams?subject=';
  static const String
  getAllExamQuestions =
      '$baseUrl/questions?exam=';
}
