import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import '../../../../../config/models/dto/user_dto.dart';
import '../../../../../config/models/user_model.dart';
import '../../domain/repo/login_repo_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImp implements LoginRepoContract {
  LoginRepoImp(this.loginRemoteDataSource, this.loginLocalDataSource);

  final LoginRemoteDataSourceContract loginRemoteDataSource;
  final LoginLocalDataSourceContract loginLocalDataSource;

  @override
  Future<BaseResponse<UserModel>> login({
    required String email,
    required String password,
  })async {
    final response = await loginRemoteDataSource.login(email: email, password: password);
    switch(response){
      case SuccessBaseResponse<UserDto>():
      return SuccessBaseResponse<UserModel>(
        data: response.data.toDomain(),
      );
      case ErrorBaseResponse<UserDto>():
      return ErrorBaseResponse<UserModel>(
        errorMessage: response.errorMessage,
      );
    }
  }
}
