import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/answer_entity.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
  final String? answer;
  final AnswerKey? key;

  AnswerDto({this.answer, this.key});

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);
  AnswerEntity toDomain() =>
      AnswerEntity(answerText: answer ?? '', answerKey: key ?? AnswerKey.A1);
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
