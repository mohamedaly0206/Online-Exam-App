import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exam_questions_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/repo/exam_questions_repo_contract.dart';

@injectable
class GetExamQuestionsUseCase {
  final ExamQuestionsRepoContract _examQuestionsRepoContract;

  GetExamQuestionsUseCase(this._examQuestionsRepoContract);
  Future<BaseResponse<ExamQuestionsEntity>> call({
    String? examId,
    String? token,
  }) {
    return _examQuestionsRepoContract.getExamsQuestions(
      examId: examId,
      token: token,
    );
  }
}
