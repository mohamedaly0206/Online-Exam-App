import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/logout_entity.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  final String? message;

  LogoutResponse({this.message});

  LogoutEntity toDomain() {
    return LogoutEntity(message: message ?? "Success");
  }

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
