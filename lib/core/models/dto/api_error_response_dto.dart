
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/core/models/api_error_response_model.dart';

part 'api_error_response_dto.g.dart';

ApiErrorResponseDto apiErrorResponseDtoFromJson(String str) => ApiErrorResponseDto.fromJson(json.decode(str));

String apiErrorResponseDtoToJson(ApiErrorResponseDto data) => json.encode(data.toJson());

@JsonSerializable()
class ApiErrorResponseDto {
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "code")
    final int? code;

    ApiErrorResponseDto({
        this.message,
        this.code,
    });

    factory ApiErrorResponseDto.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseDtoFromJson(json);

    Map<String, dynamic> toJson() => _$ApiErrorResponseDtoToJson(this);
    ApiErrorResponseModel toDomain() => ApiErrorResponseModel(message: message, code: code);
}
