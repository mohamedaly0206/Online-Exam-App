import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/edit_profile/data/data_source/edit_profile_remote_data_source_contract.dart';
import 'package:online_exam_app/features/edit_profile/data/models/logout_response.dart';
import 'package:online_exam_app/features/edit_profile/domain/entities/logout_entity.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/models/user_model/user_dto.dart';
import '../../../../config/models/user_model/user_entity.dart';
import '../../../../config/security_storage/security_storage.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/values/app_strings.dart';
import '../../domain/repo/edit_profile_repo_contract.dart';
import '../models/edit_profile_request_body.dart';

@Injectable(as: EditProfileRepoContract)
class EditProfileRepoImp implements EditProfileRepoContract {
  EditProfileRepoImp(
    this._editProfileRemoteDataSourceContract,
    this._securityStorage,
  );

  final EditProfileRemoteDataSourceContract
  _editProfileRemoteDataSourceContract;
  final SecurityStorage _securityStorage;

  @override
  Future<BaseResponse<UserEntity>> editProfile({
    //String? image,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    try {
      final token = await _securityStorage.getSecuredString(AppStrings.token);

      if (token.isEmpty) {
        return ErrorBaseResponse<UserEntity>(
          errorMessage: AppStrings.getCacheExceptionMessage,
        );
      }
      final requestBody = EditProfileRequestBody(
        //image: image,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      final response = await _editProfileRemoteDataSourceContract.editProfile(
        editProfileRequestBody: requestBody,
        token: token,
      );

      switch (response) {
        case SuccessBaseResponse<UserDto>():
          return SuccessBaseResponse<UserEntity>(
            data: response.data.toDomain(),
          );

        case ErrorBaseResponse<UserDto>():
          return ErrorBaseResponse<UserEntity>(
            errorMessage: response.errorMessage,
          );
      }
    } catch (e) {
      return ErrorBaseResponse<UserEntity>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }

  @override
  Future<BaseResponse<LogoutEntity>> logout() async {
    try {
      final token = await _securityStorage.getSecuredString(AppStrings.token);

      if (token.isEmpty) {
        return ErrorBaseResponse<LogoutEntity>(
          errorMessage: AppStrings.getCacheExceptionMessage,
        );
      }

      final response = await _editProfileRemoteDataSourceContract.logout(
        token: token,
      );

      switch (response) {
        case SuccessBaseResponse<LogoutResponse>():
          await _securityStorage.deleteSecuredString(AppStrings.token);

          return SuccessBaseResponse<LogoutEntity>(
            data: response.data.toDomain(),
          );

        case ErrorBaseResponse<LogoutResponse>():
          return ErrorBaseResponse<LogoutEntity>(
            errorMessage: response.errorMessage,
          );
      }
    } catch (e) {
      return ErrorBaseResponse<LogoutEntity>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
