import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/exams/data/model/exam_model_dto.dart';
import '../../data/data_source/exams_remote_data_source_contract.dart';
import '../api_client/exams_api_client.dart';

@Injectable(as: ExamsRemoteDataSourceContract)
class ExamsRemoteDataSourceImpl extends ExamsRemoteDataSourceContract {
  ExamsRemoteDataSourceImpl({required this.examsApiClient});
  final ExamsApiClient examsApiClient;

  @override
  Future<BaseResponse<List<ExamModelDTO>>> getExams({
    required String token,
    String? subjectId,
  }) async {
    try {
      final response = await examsApiClient.getExams(token, subjectId);
      return SuccessBaseResponse<List<ExamModelDTO>>(
        data: response.exams?.whereType<ExamModelDTO>().toList() ?? [],
      );
    } catch (e) {
      return ErrorBaseResponse<List<ExamModelDTO>>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
