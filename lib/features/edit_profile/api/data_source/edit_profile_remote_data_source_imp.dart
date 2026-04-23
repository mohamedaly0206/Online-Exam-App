import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/models/user_model/user_dto.dart';
import '../../../../core/errors/failures.dart';
import '../../data/data_source/edit_profile_remote_data_source_contract.dart';
import '../../data/models/edit_profile_request_body.dart';
import '../api_client/edit_profile_api_client.dart';

@Injectable(as: EditProfileRemoteDataSourceContract)
class EditProfileRemoteDataSourceImp
    implements EditProfileRemoteDataSourceContract {
  final EditProfileApiClient _editProfileApiClient;

  EditProfileRemoteDataSourceImp(this._editProfileApiClient);

  @override
  Future<BaseResponse<UserDto>> editProfile({
    required EditProfileRequestBody editProfileRequestBody,
  }) async {
    try {
      final response = await _editProfileApiClient.editProfile(
        editProfileRequestBody: editProfileRequestBody,
      );
      return SuccessBaseResponse<UserDto>(data: response.user!);
    } catch (e) {
      return ErrorBaseResponse<UserDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
