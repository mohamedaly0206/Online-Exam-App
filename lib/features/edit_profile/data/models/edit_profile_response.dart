import 'package:json_annotation/json_annotation.dart';

import '../../../../../config/models/user_model/user_dto.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  final String? message;
  final UserDto? user;

  EditProfileResponse({this.message, this.user});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}
