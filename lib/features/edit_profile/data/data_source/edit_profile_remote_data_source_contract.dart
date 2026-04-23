import '../../data/models/edit_profile_request_body.dart';
import '../../../../../config/models/user_model/user_dto.dart';
import '../../../../../config/base_response/base_response.dart';

abstract interface class EditProfileRemoteDataSourceContract {
  Future<BaseResponse<UserDto>> editProfile({
    required EditProfileRequestBody editProfileRequestBody,
    required String token,
  });
}
