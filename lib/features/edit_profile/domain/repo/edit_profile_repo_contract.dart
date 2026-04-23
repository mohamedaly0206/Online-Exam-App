import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/models/user_model/user_entity.dart';

abstract interface class EditProfileRepoContract {
  Future<BaseResponse<UserEntity>> editProfile({
    String? image,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });
}
