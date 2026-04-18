import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/question_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/answer_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exams_entity.dart';

class QuestionEntity {
  final String question;
  final List<AnswerEntity> answers;
  final AnswerKey correctAnswer;
  final QuestionType? type;
  final ExamsEntity? exam;

  QuestionEntity({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.type,
    this.exam,
  });
}
