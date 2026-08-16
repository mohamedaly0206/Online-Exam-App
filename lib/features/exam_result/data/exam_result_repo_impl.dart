import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/data/data_sources/exam_result_local_data_source.dart';
import 'package:online_exam_app/features/exam_result/data/models/exam_result_model.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/exam_result_repo.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamResultRepo)
class ExamResultRepoImpl implements ExamResultRepo {
  final ExamResultLocalDataSource _localDataSource;

  ExamResultRepoImpl(this._localDataSource);

  @override
  Future<BaseResponse<List<ExamResultEntity>>> getResults() async {
    try {
      final results = await _localDataSource.getResults();
      return SuccessBaseResponse<List<ExamResultEntity>>(data: results);
    } catch (e) {
      return ErrorBaseResponse<List<ExamResultEntity>>(errorMessage: e.toString());
    }
  }

  @override
  Future<BaseResponse<void>> saveResult(ExamResultEntity result) async {
    try {
      final model = ExamResultModel.fromEntity(result);
      await _localDataSource.saveResult(model);
      return SuccessBaseResponse<void>(data: null);
    } catch (e) {
      return ErrorBaseResponse<void>(errorMessage: e.toString());
    }
  }
}
