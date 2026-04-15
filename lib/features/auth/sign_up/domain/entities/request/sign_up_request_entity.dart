class SignUpRequestEntity {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  SignUpRequestEntity({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });
}
