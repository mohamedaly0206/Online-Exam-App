import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/data/models/question_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/answer_model.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/exams_model.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;
  final AnswerKey correctAnswer;
  final QuestionType? type;
  final ExamsModel? exam;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.type,
    this.exam,
  });
}
