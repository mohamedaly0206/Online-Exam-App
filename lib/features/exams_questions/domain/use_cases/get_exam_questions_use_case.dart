import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/repo/exam_questions_repo_contract.dart';

@injectable
class GetExamQuestionsUseCase {
  final ExamQuestionsRepoContract _examQuestionsRepoContract;

  GetExamQuestionsUseCase(this._examQuestionsRepoContract);
  Future<BaseResponse<ExamQuestionsEntity>> call(
    GetExamQuestionsRequest request,
  ) {
    return _examQuestionsRepoContract.getExamsQuestions(request);
  }
}
