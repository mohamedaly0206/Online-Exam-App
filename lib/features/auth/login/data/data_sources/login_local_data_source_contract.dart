

abstract class LoginLocalDataSourceContract {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}