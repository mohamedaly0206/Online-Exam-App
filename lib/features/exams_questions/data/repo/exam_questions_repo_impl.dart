import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/data/data_sources/exam_questions_remote_data_source_contract.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/exam_questions_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/repo/exam_questions_repo_contract.dart';

import '../../../../config/security_storage/security_storage.dart';

@Injectable(as: ExamQuestionsRepoContract)
class ExamQuestionsRepoImpl implements ExamQuestionsRepoContract {
  final ExamsQuestionsRemoteDataSourceContract
  examsQuestionsRemoteDataSourceContract;
  final SecurityStorage _securityStorage;
  ExamQuestionsRepoImpl(
    this.examsQuestionsRemoteDataSourceContract,
    this._securityStorage,
  );
  @override
  Future<BaseResponse<ExamQuestionsEntity>> getExamsQuestions(
    GetExamQuestionsRequest request,
  ) async {
    final token = await _securityStorage.getSecuredString(AppStrings.token);
    final updatedRequest = GetExamQuestionsRequest(
      examId: request.examId,
      token: token,
    );
    final response = await examsQuestionsRemoteDataSourceContract
        .getExamsQuestions(updatedRequest);
    switch (response) {
      case SuccessBaseResponse<ExamQuestionsDto>():
        return SuccessBaseResponse<ExamQuestionsEntity>(
          data: response.data.toDomain(),
        );
      case ErrorBaseResponse<ExamQuestionsDto>():
        return ErrorBaseResponse<ExamQuestionsEntity>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
