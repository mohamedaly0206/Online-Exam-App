import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/question_model.dart';

part 'question_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  final List<Answer>? answers;
  final QuestionType? type;

  @JsonKey(name: "_id")
  final String? id;

  final String? question;
  final AnswerKey? correct;
  final dynamic subject;
  final Exam? exam;
  final DateTime? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
  QuestionModel todomain() {
    return QuestionModel(
      answers: answers?.map((e) => e.toDomain()).toList() ?? [],
      type: type,
      question: question ?? '',
      correctAnswer: correct ?? AnswerKey.A1,
      exam: exam?.toDomain(),
    );
  }
}

enum QuestionType {
  @JsonValue("single_choice")
  singleChoice,
  @JsonValue("multiple_choice")
  multipleChoice,
}
