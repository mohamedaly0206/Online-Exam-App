import 'package:online_exam_app/config/base_response/base_response.dart';

import '../../../../../config/models/user_model/user_entity.dart';

abstract interface class LoginRepoContract {
  Future<BaseResponse<UserEntity>> login({
    // for login
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<bool> isUserLoggedIn();

  Future<BaseResponse<UserEntity>> getLoggedUserInfo(); // for auto-login
}
