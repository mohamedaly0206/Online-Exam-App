import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/question_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_questions_entity.dart';
part 'exam_questions_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamQuestionsDto {
  final String? message;
  final List<QuestionDto>? questions;

  ExamQuestionsDto({this.message, this.questions});

  factory ExamQuestionsDto.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamQuestionsDtoToJson(this);

  ExamQuestionsEntity toDomain() {
    return ExamQuestionsEntity(
      questions: questions?.map((e) => e.todomain()).toList() ?? [],
    );
  }
}
