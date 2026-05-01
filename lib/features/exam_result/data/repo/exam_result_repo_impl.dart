import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/data/data_source/exam_result_local_data_source_contract.dart';
import 'package:online_exam_app/features/exam_result/data/model/subject_result_model_dto.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/repo/exam_result_repo_contract.dart';

@Injectable(as: ExamResultRepoContract)
class ExamResultRepoImpl implements ExamResultRepoContract {
  final ExamResultLocalDataSourceContract localDataSource;
  ExamResultRepoImpl({required this.localDataSource});

  @override
  Future<BaseResponse<bool>> cacheExamResult(
    ExamResultEntity examResult,
    String subjectName,
  ) async {
    final response = await localDataSource.cacheExamResult(
      examResult,
      subjectName,
    );
    switch (response) {
      case SuccessBaseResponse<bool>():
        log('exam result cached successfully');
        return SuccessBaseResponse<bool>(data: true);
      case ErrorBaseResponse<bool>():
        log('error caching exam result: ${response.errorMessage}');
        return ErrorBaseResponse<bool>(errorMessage: response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<List<SubjectResultEntity>>>
  getExamsResultsHistory() async {
    final response = await localDataSource.getExamsResultsHistory();

    switch (response) {
      case SuccessBaseResponse<List<SubjectResultModelDTO>>():
        log(
          'got data from local data source: ${response.data.length} subjects',
        );
        return SuccessBaseResponse<List<SubjectResultEntity>>(
          data: response.data.map((e) => e.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<SubjectResultModelDTO>>():
        log(
          'error getting data from local data source: ${response.errorMessage}',
        );
        return ErrorBaseResponse<List<SubjectResultEntity>>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
