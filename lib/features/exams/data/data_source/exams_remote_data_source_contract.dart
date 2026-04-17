import '../../../../config/base_response/base_response.dart';
import '../model/exam_model_dto.dart';

abstract class ExamsRemoteDataSourceContract {
Future<BaseResponse<List<ExamModelDTO>>> getExams({
    required String token,
    required String? subjectId,
  });
}