import 'package:json_annotation/json_annotation.dart';

import '../user_model.dart';

part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "isVerified")
  final bool isVerified;
  @JsonKey(name: "createdAt")
  final String createdAt;

  UserDto({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });
  UserModel toDomain() => UserModel(
      id: id,
      userName: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      createdAt: createdAt,

  );
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}