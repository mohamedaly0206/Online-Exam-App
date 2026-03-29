import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exams_model.dart';

part 'exam_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class Exam {
  @JsonKey(name: "_id")
  final String? id;

  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);

  ExamsModel toDomain() => ExamsModel(
        duration: duration ?? 0,
        numberOfQuestions: numberOfQuestions ?? 0,
      );
}
