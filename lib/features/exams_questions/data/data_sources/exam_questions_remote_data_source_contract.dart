import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_questions_dto.dart';

abstract class ExamsQuestionsRemoteDataSourceContract {
  Future<BaseResponse<ExamQuestionsDto>> getExamsQuestions({String? examId, String? token});
}