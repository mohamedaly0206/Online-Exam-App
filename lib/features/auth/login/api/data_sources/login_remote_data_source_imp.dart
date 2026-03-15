import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import '../../../../../config/models/dto/user_dto.dart';
import '../../../../../core/errors/failures.dart';
import '../login_api_client/login_api_client.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDataSourceImp implements LoginRemoteDataSourceContract {
  LoginRemoteDataSourceImp(this.loginApiClient);
  final LoginApiClient loginApiClient;
  @override
  Future<BaseResponse<UserDto>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await loginApiClient.login(
        body: {"email": email, "password": password},
      );
      return SuccessBaseResponse<UserDto>(data: response.user);
    } catch (e) {
      if (e is DioException) {
        return ErrorBaseResponse<UserDto>(
          errorMessage: ServerFailure.fromDioException(e).errorMessage,
        );
      } else {
        return ErrorBaseResponse<UserDto>(
          errorMessage: "Something went wrong, please try again later.",
        );
      }
    }
  }
}
