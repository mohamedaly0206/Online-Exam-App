import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/home/data/models/subjects_response.dart';

import '../../../../config/security_storage/security_storage_module.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/values/app_strings.dart';
import '../../data/data_source/home_remote_data_source_contract.dart';
import '../api_client/get_all_subjects_api_client.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImp implements HomeRemoteDataSourceContract {
  final HomeApiClient homeApiClient;

  HomeRemoteDataSourceImp(this.homeApiClient);

  @override
  Future<BaseResponse<SubjectsResponse>> getAllSubjects() async {
    try {
      String token = await SecurityStorageModule.getSecuredString('token');
      if (token.isEmpty) {
        throw const CacheException(
          errorMessage: AppStrings.storeCacheExceptionMessage,
        );
      }
      final response = await homeApiClient.getAllSubjects(token: token);
      return SuccessBaseResponse<SubjectsResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<SubjectsResponse>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
