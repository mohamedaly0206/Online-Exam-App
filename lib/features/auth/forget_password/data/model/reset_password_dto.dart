import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/reset_password_model.dart';
part 'reset_password_dto.g.dart';

@JsonSerializable()
class ResetPasswordDTO {
  final String message;
  final String token;

  ResetPasswordDTO({required this.message, required this.token});

  factory ResetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDTOToJson(this);

  ResetPasswordModel toDomain() =>
      ResetPasswordModel(message: message, token: token);
}
