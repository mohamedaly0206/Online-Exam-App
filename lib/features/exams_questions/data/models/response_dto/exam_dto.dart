import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exams_entity.dart';

part 'exam_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamDto {
  @JsonKey(name: "_id")
  final String? id;

  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  ExamsEntity toDomain() => ExamsEntity(
    duration: duration ?? 0,
    numberOfQuestions: numberOfQuestions ?? 0,
  );
}
