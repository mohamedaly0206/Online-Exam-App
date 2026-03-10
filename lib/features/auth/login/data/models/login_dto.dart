import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/login/data/models/responses/user.dart';
part 'login_dto.g.dart';
@JsonSerializable()
class LoginDto {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "user")
  final User user;

  LoginDto({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}


