import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/exams_questions/api/exams_questions_api_client/exam_questions_api_client.dart';
import 'package:online_exam_app/features/exams_questions/data/data_sources/exam_questions_remote_data_source_contract.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_questions_dto.dart';

@Injectable(as: ExamsQuestionsRemoteDataSourceContract)
class ExamQuetsionsRemoteDataSourceImp
    implements ExamsQuestionsRemoteDataSourceContract {
  final ExamQuetsionsApiClient examQuetsionsApiClient;

  ExamQuetsionsRemoteDataSourceImp(this.examQuetsionsApiClient);
  @override
  Future<BaseResponse<ExamQuestionsDto>> getExamsQuestions({
    String? examId,
    String? token,
  }) async {
    try {
      final response = await examQuetsionsApiClient.getExamsQuestions(
        examId: examId!,
        token: token!,
      );
      return SuccessBaseResponse<ExamQuestionsDto>(data: response);
    } catch (e) {
      return ErrorBaseResponse<ExamQuestionsDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}