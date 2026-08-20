import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/exam_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/subject_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/question_entity.dart';

part 'question_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionDto {
  final List<AnswerDto>? answers;
  final QuestionType? type;

  @JsonKey(name: "_id")
  final String? id;

  final String? question;
  final AnswerKey? correct;
  final Subject? subject;
  final ExamDto? exam;
  final DateTime? createdAt;

  QuestionDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
  QuestionEntity todomain() {
    return QuestionEntity(
      answers: answers?.map((e) => e.toDomain()).toList() ?? [],
      type: type,
      question: question ?? '',
      correctAnswer: correct ?? AnswerKey.A1,
      exam: exam?.toDomain(),
      subject: subject?.toDomain(),
    );
  }
}

enum QuestionType {
  @JsonValue("single_choice")
  singleChoice,
  @JsonValue("multiple_choice")
  multipleChoice,
}
