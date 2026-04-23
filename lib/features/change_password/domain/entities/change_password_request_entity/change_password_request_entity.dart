class ChangePasswordRequestEntity {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordRequestEntity({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}