import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/forget_password_model.dart';
part 'forget_password_dto.g.dart';

@JsonSerializable()
class ForgetPasswordDTO {
  final String message;
  final String info;

  ForgetPasswordDTO({required this.message, required this.info});

  factory ForgetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordDTOToJson(this);

  ForgetPasswordModel toDomain() =>
      ForgetPasswordModel(message: message, info: info);
}
