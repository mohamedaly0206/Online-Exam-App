import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_request_entity/change_password_request_entity.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  @JsonKey(name: "oldPassword")
  final String oldPassword;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "rePassword")
  final String rePassword;

  ChangePasswordRequestDto({
    required this.oldPassword,
    required this.password,
    required this.rePassword,
  });

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);
  factory ChangePasswordRequestDto.fromDomain(
    ChangePasswordRequestEntity model,
  ) {
    return ChangePasswordRequestDto(
      oldPassword: model.currentPassword,
      password: model.newPassword,
      rePassword: model.confirmPassword,
    );
  }
}
