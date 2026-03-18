import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';
import '../../../../../core/errors/exceptions.dart';

@Injectable(as: LoginLocalDataSourceContract)
class LoginLocalDataSourceImp implements LoginLocalDataSourceContract {
  @override
  Future<void> saveToken(String token) async {
    try {
      await SecurityStorageModule.setSecuredString('token', token);
    } catch (e) {
      throw const CacheException(
        errorMessage: 'Failed to save data locally, please try again later.',
      );
    }
  }

  @override
  Future<String?> getToken() async{
    try{
      return await SecurityStorageModule.getSecuredString('token');
    }catch(e){
      throw const CacheException(
        errorMessage: 'Failed to get data locally, please try again later.',
      );
    }
  }
  @override
  Future<void> saveRememberMe(bool value) {
    try{
      return  SecurityStorageModule.setSecuredBool('rememberMe', value);
    }catch(e){
      throw const CacheException(
        errorMessage: 'Failed to save data locally, please try again later.',
      );
    }
  }
  @override
  Future<bool> getRememberMe() {
    try{
      return  SecurityStorageModule.getSecuredBool('rememberMe');
    }catch(e){
      throw const CacheException(
        errorMessage: 'Failed to save data locally, please try again later.',
      );
    }
  }
}
