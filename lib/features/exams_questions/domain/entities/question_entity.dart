import 'package:online_exam_app/features/exams_questions/data/models/response_dto/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/question_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/answer_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exam_subject_entity.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/exams_entity.dart';

class QuestionEntity {
  final String question;
  final List<AnswerEntity> answers;
  final AnswerKey correctAnswer;
  final QuestionType? type;
  final ExamsEntity? exam;
  final ExamSubjectEntity? subject;

  QuestionEntity({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.subject,
    this.type,
    this.exam,
  });
}
