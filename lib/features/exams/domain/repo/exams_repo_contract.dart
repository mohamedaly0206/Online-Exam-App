import '../../../../config/base_response/base_response.dart';
import '../model/exams_model.dart';

abstract class ExamsRepoContract {
  Future<BaseResponse<List<ExamModel>>> getExams({String? subjectId});
}
