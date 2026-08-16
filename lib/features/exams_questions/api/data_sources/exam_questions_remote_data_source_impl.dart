import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/exams_questions/api/exams_questions_api_client/exam_questions_api_client.dart';
import 'package:online_exam_app/features/exams_questions/data/data_sources/exam_questions_remote_data_source_contract.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/exam_questions_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/get_exam_questions_request/exam_questions_request.dart';

@Injectable(as: ExamsQuestionsRemoteDataSourceContract)
class ExamQuestionsRemoteDataSourceImp
    implements ExamsQuestionsRemoteDataSourceContract {
  final ExamQuestionsApiClient examQuestionsApiClient;

  ExamQuestionsRemoteDataSourceImp(this.examQuestionsApiClient);
  @override
  Future<BaseResponse<ExamQuestionsDto>> getExamsQuestions(
    GetExamQuestionsRequest request,
  ) async {
    try {
      final response = await examQuestionsApiClient.getExamsQuestions(
        examId: request.examId,
        token: request.token ?? '',
      );
      return SuccessBaseResponse<ExamQuestionsDto>(data: response);
    } catch (e) {
      return ErrorBaseResponse<ExamQuestionsDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
