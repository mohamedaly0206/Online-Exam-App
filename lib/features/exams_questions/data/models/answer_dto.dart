import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/answer_model.dart';

part 'answer_dto.g.dart';
@JsonSerializable()
class Answer {
  final String? answer;
  final AnswerKey? key;

  Answer({
    this.answer,
    this.key,
  });

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
  AnswerModel toDomain() => AnswerModel(answerText: answer?? '', answerKey: key?? AnswerKey.A1); 
}


enum AnswerKey {
  @JsonValue("A1")
  A1,
  @JsonValue("A2")
  A2,
  @JsonValue("A3")
  A3,
  @JsonValue("A4")
  A4,
}