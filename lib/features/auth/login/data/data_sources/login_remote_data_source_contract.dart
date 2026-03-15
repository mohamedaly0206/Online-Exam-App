import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/models/dto/user_dto.dart';

abstract class LoginRemoteDataSourceContract {
  Future<BaseResponse<UserDto>> login({required String email, required String password});

}