import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams_questions/data/data_sources/exam_questions_remote_data_source_contract.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_questions_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exam_questions_model.dart';
import 'package:online_exam_app/features/exams_questions/domain/repo/exam_questions_repo_contract.dart';

@Injectable(as: ExamQuestionsRepoContract)
class ExamQuestionsRepoImpl implements ExamQuestionsRepoContract {
  final ExamsQuestionsRemoteDataSourceContract
  examsQuestionsRemoteDataSourceContract;

  ExamQuestionsRepoImpl(this.examsQuestionsRemoteDataSourceContract);
  @override
  Future<BaseResponse<ExamQuestionsModel>> getExamsQuestions({
    String? examId,
    String? token,
  }) async {
    final response = await examsQuestionsRemoteDataSourceContract
        .getExamsQuestions(examId: examId, token: token);
    switch (response) {
      case SuccessBaseResponse<ExamQuestionsDto>():
        return SuccessBaseResponse<ExamQuestionsModel>(
          data: response.data.toDomain(),
        );
      case ErrorBaseResponse<ExamQuestionsDto>():
        return ErrorBaseResponse<ExamQuestionsModel>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
