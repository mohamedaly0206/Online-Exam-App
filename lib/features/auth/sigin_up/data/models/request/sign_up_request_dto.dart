import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam_app/features/auth/sigin_up/domain/models/request/sign_up_request_model.dart';

part 'sign_up_request_dto.g.dart';

SignUpRequestDto signUpRequestDtoFromJson(String str) =>
    SignUpRequestDto.fromJson(json.decode(str));

String signUpRequestDtoToJson(SignUpRequestDto data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  SignUpRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
  
  factory SignUpRequestDto.fromDomain(SignUpRequestModel model) {
    return SignUpRequestDto(
      username: model.userName,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      password: model.password,
      rePassword: model.confirmPassword,
      phone: model.phone,
    );
  }

}
