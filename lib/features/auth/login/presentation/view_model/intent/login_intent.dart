sealed class LoginIntent {}

class LoginSubmitIntent extends LoginIntent {
  final String email;
  final String password;

  LoginSubmitIntent({required this.email, required this.password});
}
