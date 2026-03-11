
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'sign_up_response_dto.g.dart';

SignUpResponseDto signUpResponseDtoFromJson(String str) => SignUpResponseDto.fromJson(json.decode(str));

String signUpResponseDtoToJson(SignUpResponseDto data) => json.encode(data.toJson());

@JsonSerializable()
class SignUpResponseDto {
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "token")
    final String? token;
    @JsonKey(name: "user")
    final User? user;

    SignUpResponseDto({
        this.message,
        this.token,
        this.user,
    });

    factory SignUpResponseDto.fromJson(Map<String, dynamic> json) => _$SignUpResponseDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SignUpResponseDtoToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "username")
    final String? username;
    @JsonKey(name: "firstName")
    final String? firstName;
    @JsonKey(name: "lastName")
    final String? lastName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "phone")
    final String? phone;
    @JsonKey(name: "role")
    final String? role;
    @JsonKey(name: "isVerified")
    final bool? isVerified;
    @JsonKey(name: "_id")
    final String? id;
    @JsonKey(name: "createdAt")
    final DateTime? createdAt;

    User({
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.role,
        this.isVerified,
        this.id,
        this.createdAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
