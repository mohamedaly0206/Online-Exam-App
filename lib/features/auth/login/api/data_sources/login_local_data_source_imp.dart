import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/security_storage/security_storage.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/login/data/data_sources/login_local_data_source_contract.dart';

import '../../../../../core/errors/exceptions.dart';

@Injectable(as: LoginLocalDataSourceContract)
class LoginLocalDataSourceImp implements LoginLocalDataSourceContract {
  final SecurityStorage _securityStorage;

  LoginLocalDataSourceImp(this._securityStorage);

  @override
  Future<void> saveToken(String token) async {
    try {
      await _securityStorage.setSecuredString(AppStrings.token, token);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.storeCacheExceptionMessage,
      );
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await _securityStorage.getSecuredString(AppStrings.token);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }

  @override
  Future<void> saveRememberMe(bool value) async {
    try {
      await _securityStorage.setSecuredBool(AppStrings.rememberMeKey, value);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.storeCacheExceptionMessage,
      );
    }
  }

  @override
  Future<bool> getRememberMe() async {
    try {
      return await _securityStorage.getSecuredBool(AppStrings.rememberMeKey);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }

  @override
  Future<void> saveUserId(String userId) async {
    try {
      await _securityStorage.setSecuredString(AppStrings.userIdKey, userId);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.storeCacheExceptionMessage,
      );
    }
  }

  @override
  Future<String?> getUserId() async {
    try {
      return await _securityStorage.getSecuredString(AppStrings.userIdKey);
    } catch (e) {
      throw const CacheException(
        errorMessage: AppStrings.getCacheExceptionMessage,
      );
    }
  }
}
