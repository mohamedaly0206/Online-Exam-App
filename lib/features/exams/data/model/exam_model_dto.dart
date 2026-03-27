import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams/domain/model/exams_model.dart';

part 'exam_model_dto.g.dart';

@JsonSerializable()
class ExamModelDTO {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'duration')
  final int? duration;
  @JsonKey(name: 'subject')
  final String? subject;
  @JsonKey(name: 'numberOfQuestions')
  final int? numberOfQuestions;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  ExamModelDTO({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamModelDTO.fromJson(Map<String, dynamic> json) =>
      _$ExamModelDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelDTOToJson(this);

  ExamModel toDomain() => ExamModel(
    id: id,
    title: title,
    duration: duration,
    subject: subject,
    numberOfQuestions: numberOfQuestions,
  );
}
