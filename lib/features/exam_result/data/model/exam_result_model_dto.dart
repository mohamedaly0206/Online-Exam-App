import 'package:hive_ce/hive_ce.dart';
import 'package:online_exam_app/features/exam_result/data/model/question_detail_model_dto.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';

part 'exam_result_model_dto.g.dart';

@HiveType(typeId: 0)
class ExamResultModelDTO extends HiveObject {
  @HiveField(0)
  final String examTitle;
  @HiveField(1)
  final String subjectName;
  @HiveField(2)
  final int totalQuestions;
  @HiveField(3)
  final int correctAnswers;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final List<QuestionDetailModelDTO> questions;

  ExamResultModelDTO({
    required this.examTitle,
    required this.subjectName,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.time,
    required this.questions,
  });

  ExamResultEntity toDomain() {
    return ExamResultEntity(
      examTitle: examTitle,
      // subjectName: subjectName,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      duration: time,
      questions: questions.map((q) => q.toDomain()).toList(),
    );
  }

  factory ExamResultModelDTO.fromDomain(
    ExamResultEntity entity,
    String subjectName,
  ) {
    return ExamResultModelDTO(
      examTitle: entity.examTitle,
      subjectName: subjectName,
      totalQuestions: entity.totalQuestions,
      correctAnswers: entity.correctAnswers,
      time: entity.duration,
      questions: entity.questions
          .map((q) => QuestionDetailModelDTO.fromDomain(q))
          .toList(),
    );
  }
}
