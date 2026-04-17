import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams/data/model/exam_model_dto.dart';

import '../../../../config/models/metadata_model/metadata_model.dart';

part 'get_exams_response.g.dart';

@JsonSerializable()
class GetExamsResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'metadata')
  final MetadataModel? metadata;
  @JsonKey(name: 'exams')
  final List<ExamModelDTO?>? exams;

  GetExamsResponse({
    this.message,
    this.metadata,
    this.exams,
  });

  factory GetExamsResponse.fromJson(Map<String, dynamic> json) => _$GetExamsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetExamsResponseToJson(this);



}

