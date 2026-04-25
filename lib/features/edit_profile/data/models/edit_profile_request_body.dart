import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {
  //final String? image;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;

  EditProfileRequestBody({
    //this.image,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);

  factory EditProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestBodyFromJson(json);
}
