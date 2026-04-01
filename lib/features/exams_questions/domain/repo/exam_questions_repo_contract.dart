import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exam_questions_model.dart';

abstract class ExamQuestionsRepoContract {
  Future<BaseResponse<ExamQuestionsModel>> getExamsQuestions({
    String? examId,
    String? token,
  });
}
