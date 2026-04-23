import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/edit_profile/data/data_source/edit_profile_remote_data_source_contract.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/models/user_model/user_dto.dart';
import '../../../../config/models/user_model/user_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repo/edit_profile_repo_contract.dart';
import '../models/edit_profile_request_body.dart';

@Injectable(as: EditProfileRepoContract)
class EditProfileRepoImp implements EditProfileRepoContract {
  EditProfileRepoImp(this._editProfileRemoteDataSourceContract);

  final EditProfileRemoteDataSourceContract
  _editProfileRemoteDataSourceContract;

  @override
  Future<BaseResponse<UserEntity>> editProfile({
    String? image,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    try {
      final requestBody = EditProfileRequestBody(
        image: image,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      final response = await _editProfileRemoteDataSourceContract.editProfile(
        editProfileRequestBody: requestBody,
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
}
