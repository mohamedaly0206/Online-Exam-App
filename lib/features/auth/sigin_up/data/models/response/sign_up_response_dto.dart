import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/config/models/dto/user_dto.dart';
import 'dart:convert';

import 'package:online_exam_app/features/auth/sigin_up/domain/models/response/sign_up_response_model.dart';

part 'sign_up_response_dto.g.dart';

SignUpResponseDto signUpResponseDtoFromJson(String str) =>
    SignUpResponseDto.fromJson(json.decode(str));

String signUpResponseDtoToJson(SignUpResponseDto data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  SignUpResponseDto({this.message, this.token, this.user});

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDtoToJson(this);

  SignUpResponseModel toDomain() {
    return SignUpResponseModel(
      message: message ?? '',
      token: token ?? '',
      user: user?.toDomain(),
    );
  }
}
