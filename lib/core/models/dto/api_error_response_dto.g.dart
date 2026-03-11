// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponseDto _$ApiErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    ApiErrorResponseDto(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApiErrorResponseDtoToJson(
  ApiErrorResponseDto instance,
) => <String, dynamic>{'message': instance.message, 'code': instance.code};
