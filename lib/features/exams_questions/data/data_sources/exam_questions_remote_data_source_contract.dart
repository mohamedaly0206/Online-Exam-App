import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/exam_questions_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';

abstract interface class ExamsQuestionsRemoteDataSourceContract {
  Future<BaseResponse<ExamQuestionsDto>> getExamsQuestions(
    GetExamQuestionsRequest request,
  );
}
