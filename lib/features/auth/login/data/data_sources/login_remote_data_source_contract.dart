import 'package:online_exam_app/features/auth/login/data/models/responses/user_dto.dart';

import '../../../../../config/base_response/base_response.dart';

abstract class LoginRemoteDataSourceContract {
  Future<BaseResponse<UserDto>> login({required String email, required String password});

}