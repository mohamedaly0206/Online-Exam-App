import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/home/data/data_source/home_remote_data_source_contract.dart';
import 'package:online_exam_app/features/home/data/models/responses/subject_dto.dart';
import 'package:online_exam_app/features/home/domain/model/subject_entity.dart';

import '../../../../config/security_storage/security_storage.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/values/app_strings.dart';
import '../../domain/repo/home_repo_contract.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImp implements HomeRepoContract {
  HomeRepoImp(this.homeRemoteDataSourceContract, this._securityStorage);

  final HomeRemoteDataSourceContract homeRemoteDataSourceContract;
  final SecurityStorage _securityStorage;

  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    try {
      final token = await _securityStorage.getSecuredString(AppStrings.token);

      if (token.isEmpty) {
        return ErrorBaseResponse<List<SubjectEntity>>(
          errorMessage: AppStrings.getCacheExceptionMessage,
        );
      }

      final response = await homeRemoteDataSourceContract.getAllSubjects(token);

      switch (response) {
        case SuccessBaseResponse<List<SubjectDto>>():
          return SuccessBaseResponse<List<SubjectEntity>>(
            data: response.data.map((e) => e.toDomain()).toList(),
          );

        case ErrorBaseResponse<List<SubjectDto>>():
          return ErrorBaseResponse<List<SubjectEntity>>(
            errorMessage: response.errorMessage,
          );
      }
    } on CacheException catch (e) {
      return ErrorBaseResponse<List<SubjectEntity>>(
        errorMessage: CacheFailure(e).errorMessage,
      );
    } catch (e) {
      return ErrorBaseResponse<List<SubjectEntity>>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
