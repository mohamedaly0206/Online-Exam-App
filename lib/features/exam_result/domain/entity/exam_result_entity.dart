import 'package:online_exam_app/features/exam_result/domain/entity/question_detail_entity.dart';

class ExamResultEntity {
  final String examTitle;
  final String duration;
  final int totalQuestions;
  final int correctAnswers;
  final List<QuestionDetailEntity> questions;

  ExamResultEntity({
    required this.examTitle,
    required this.duration,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.questions,
  });
}
