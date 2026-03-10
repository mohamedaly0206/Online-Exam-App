import 'package:online_exam_app/config/base_response/base_response.dart';

import '../models/user_model.dart';

abstract class LoginRepoContract {
Future<BaseResponse<UserModel>> login({required String email, required String password});
}