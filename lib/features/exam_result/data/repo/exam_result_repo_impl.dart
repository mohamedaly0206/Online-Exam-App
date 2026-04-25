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
  ) async{
    return await localDataSource.cacheExamResult(examResult, subjectName);
  }

  @override
  Future<BaseResponse<List<SubjectResultEntity>>> getExamsResultsHistory() async{
    final response= await localDataSource.getExamsResultsHistory();

    switch(response){
      case SuccessBaseResponse<List<SubjectResultModelDTO>>():
        return SuccessBaseResponse<List<SubjectResultEntity>>(
          data: response.data.map((e) => e.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<SubjectResultModelDTO>>():
        return ErrorBaseResponse<List<SubjectResultEntity>>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
