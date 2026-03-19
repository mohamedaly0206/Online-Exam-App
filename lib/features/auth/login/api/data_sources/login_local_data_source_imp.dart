import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';
import '../../../../../core/errors/exceptions.dart';

@Injectable(as: LoginLocalDataSourceContract)
class LoginLocalDataSourceImp implements LoginLocalDataSourceContract {
  @override
  Future<void> saveToken(String token) async {
    try {
      await SecurityStorageModule.setSecuredString(AppStrings.tokenKey, token);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.storeCacheExceptionMessage,
      );
    }
  }

  @override
  Future<String?> getToken() async{
    try{
      return await SecurityStorageModule.getSecuredString(AppStrings.tokenKey);
    }catch(e){
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }
  @override
  Future<void> saveRememberMe(bool value) {
    try{
      return  SecurityStorageModule.setSecuredBool(AppStrings.rememberMeKey, value);
    }catch(e){
      throw const CacheException(
        errorMessage: AppStrings.storeCacheExceptionMessage,
      );
    }
  }
  @override
  Future<bool> getRememberMe() {
    try{
      return  SecurityStorageModule.getSecuredBool(AppStrings.rememberMeKey);
    }catch(e){
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }
}
