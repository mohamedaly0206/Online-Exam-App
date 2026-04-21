import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_local_data_source_contract.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_remote_data_source_contract.dart';
import 'package:online_exam_app/features/exams/data/model/exam_model_dto.dart';
import 'package:online_exam_app/features/exams/domain/entity/exams_entity.dart';
import 'package:online_exam_app/features/exams/domain/repo/exams_repo_contract.dart';

@Singleton(as: ExamsRepoContract)
class ExamsRepoImpl implements ExamsRepoContract {
  ExamsRepoImpl({
    required this.examsRemoteDataSourceContract,
    required this.examsLocalDataSourceContract,
  });

  final ExamsRemoteDataSourceContract examsRemoteDataSourceContract;
  final ExamsLocalDataSourceContract examsLocalDataSourceContract;
  @override
  Future<BaseResponse<List<ExamEntity>>> getExams({
    required String subjectId,
  }) async {
    final token = await examsLocalDataSourceContract.getToken();
    final response = await examsRemoteDataSourceContract.getExams(
      token: token ?? '',
      subjectId: subjectId,
    );

    switch (response) {
      case SuccessBaseResponse<List<ExamModelDTO>>():
        return SuccessBaseResponse<List<ExamEntity>>(
          data: response.data.map((e) => e.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<ExamModelDTO>>():
        return ErrorBaseResponse<List<ExamEntity>>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
