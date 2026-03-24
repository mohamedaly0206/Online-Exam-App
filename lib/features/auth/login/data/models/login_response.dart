import 'package:json_annotation/json_annotation.dart';

import '../../../../../config/models/dto/user_dto.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "user")
  final UserDto user;

  LoginResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
