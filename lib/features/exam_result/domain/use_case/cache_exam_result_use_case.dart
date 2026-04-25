import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/data/data_source/exam_result_local_data_source_contract.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';

@injectable
class CacheExamResultUseCase {
  final ExamResultLocalDataSourceContract localDataSource;

  CacheExamResultUseCase(this.localDataSource);

  Future<BaseResponse<bool>> call(
    ExamResultEntity examResult,
    String subjectName,
  ) => localDataSource.cacheExamResult(examResult, subjectName);
}
