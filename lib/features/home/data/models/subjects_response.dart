import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/config/models/metadata_model/metadata_model.dart';
import 'package:online_exam_app/features/home/data/models/responses/subject_dto.dart';

part 'subjects_response.g.dart';

@JsonSerializable()
class SubjectsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataModel? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectDto>? subjects;

  SubjectsResponse({this.message, this.metadata, this.subjects});

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}
