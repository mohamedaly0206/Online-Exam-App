import '../../../../config/base_response/base_response.dart';
import '../entity/exams_entity.dart';

abstract interface class ExamsRepoContract {
  Future<BaseResponse<List<ExamEntity>>> getExams({required String subjectId});
}
