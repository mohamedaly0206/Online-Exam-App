import 'package:online_exam_app/features/auth/login/data/models/login_response.dart';

import '../../../../../config/base_response/base_response.dart';

abstract interface class LoginRemoteDataSourceContract {
  Future<BaseResponse<LoginResponse>> login({
    required String email,
    required String password,
  });
}
