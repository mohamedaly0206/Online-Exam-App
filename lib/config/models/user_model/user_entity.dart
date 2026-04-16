class UserEntity {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? id;
  final String? createdAt;

  UserEntity({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.id,
    this.createdAt,
  });
}
