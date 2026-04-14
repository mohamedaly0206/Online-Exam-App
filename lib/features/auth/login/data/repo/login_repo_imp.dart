import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:online_exam_app/features/auth/login/data/models/login_response.dart';

import '../../../../../config/models/user_model/user_entity.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/repo/login_repo_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImp implements LoginRepoContract {
  LoginRepoImp(this.loginRemoteDataSource, this.loginLocalDataSource);

  final LoginRemoteDataSourceContract loginRemoteDataSource;
  final LoginLocalDataSourceContract loginLocalDataSource;

  @override
  Future<BaseResponse<UserEntity>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final response = await loginRemoteDataSource.login(
      email: email,
      password: password,
    );

    switch (response) {
      case SuccessBaseResponse<LoginResponse>():
      // try to store token locally
        try {
          // local can throw exception, so there is try-catch
          await loginLocalDataSource.saveToken(response.data.token!);
          await loginLocalDataSource.saveRememberMe(rememberMe);

          return SuccessBaseResponse<UserEntity>(
            // send UserDto to (toDomain)
            data: response.data.user!.toDomain(),
          );
        } catch (e) {
          return ErrorBaseResponse<UserEntity>(
            errorMessage: CacheFailure(e).errorMessage,
          );
        }

      case ErrorBaseResponse<LoginResponse>():
        return ErrorBaseResponse<UserEntity>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    try {
      final rememberMe = await loginLocalDataSource.getRememberMe();

      final token = await loginLocalDataSource.getToken();

      return rememberMe && (token != null && token.isNotEmpty);
    } catch (e) {
      return false;
    }
  }
}