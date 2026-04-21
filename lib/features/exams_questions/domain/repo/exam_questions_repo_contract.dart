import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';

abstract interface class ExamQuestionsRepoContract {
  Future<BaseResponse<ExamQuestionsEntity>> getExamsQuestions(
    GetExamQuestionsRequest request,
  );
}
