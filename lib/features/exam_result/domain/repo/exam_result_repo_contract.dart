import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';

abstract interface class ExamResultRepoContract {
  Future<BaseResponse<bool>> cacheExamResult(
    ExamResultEntity examResult,
    String subjectName,
  );
  Future<BaseResponse<List<SubjectResultEntity>>> getExamsResultsHistory();
}
