import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exams/data/data_source/exams_local_data_source_contract.dart';
import 'package:online_exam_app/features/exams/domain/repo/exams_repo_contract.dart';

import '../../domain/model/exams_model.dart';
import '../data_source/exams_remote_data_source_contract.dart';
import '../model/exam_model_dto.dart';

class ExamsRepoImpl extends ExamsRepoContract {
  ExamsRepoImpl({
    required this.examsRemoteDataSourceContract,
    required this.examsLocalDataSourceContract,
  });

  final ExamsRemoteDataSourceContract examsRemoteDataSourceContract;
  final ExamsLocalDataSourceContract examsLocalDataSourceContract;
  @override
  Future<BaseResponse<List<ExamModel>>> getExams({
    required String token,
    required String? subjectId,
  }) async {
    final response = await examsRemoteDataSourceContract.getExams(
      token: token,
      subjectId: subjectId,
    );

    switch (response) {
      case SuccessBaseResponse<List<ExamModelDTO>>():
        return SuccessBaseResponse<List<ExamModel>>(
          data: response.data.map((e) => e.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<ExamModelDTO>>():
        return ErrorBaseResponse<List<ExamModel>>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
