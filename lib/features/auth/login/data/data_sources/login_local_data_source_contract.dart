abstract class LoginLocalDataSourceContract {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> saveRememberMe(bool value);

  Future<bool> getRememberMe();
}
