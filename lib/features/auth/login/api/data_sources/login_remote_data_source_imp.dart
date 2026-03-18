import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import '../../../../../core/errors/failures.dart';
import '../../data/models/login_response.dart';
import '../login_api_client/login_api_client.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDataSourceImp implements LoginRemoteDataSourceContract {
  LoginRemoteDataSourceImp(this.loginApiClient);

  final LoginApiClient loginApiClient;

  @override
  @override
  Future<BaseResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await loginApiClient.login(
        body: {"email": email, "password": password},
      );

      return SuccessBaseResponse<LoginResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse<LoginResponse>(
        errorMessage: ServerFailure.fromDioException(e).errorMessage,
      );
    }
    catch (e) {
      return ErrorBaseResponse<LoginResponse>(
        errorMessage: "Something went wrong, please try again later.",
      );
    }
  }
}
