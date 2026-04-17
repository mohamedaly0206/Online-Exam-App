import 'package:online_exam_app/config/base_response/base_response.dart';

import '../../../../../config/models/user_model/user_model.dart';

abstract interface class LoginRepoContract {
  Future<BaseResponse<UserModel>> login({
    // for login
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<bool> isUserLoggedIn();

  Future<BaseResponse<UserModel>> getLoggedUserInfo(); // for auto-login
}
