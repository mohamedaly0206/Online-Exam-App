// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordDTO _$ResetPasswordDTOFromJson(Map<String, dynamic> json) =>
    ResetPasswordDTO(
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ResetPasswordDTOToJson(ResetPasswordDTO instance) =>
    <String, dynamic>{'message': instance.message, 'token': instance.token};
