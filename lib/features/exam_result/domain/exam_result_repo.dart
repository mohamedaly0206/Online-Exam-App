import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

abstract class ExamResultRepo {
  Future<BaseResponse<List<ExamResultEntity>>> getResults();
  Future<BaseResponse<void>> saveResult(ExamResultEntity result);
}
