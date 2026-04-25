import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';

class SubjectResultEntity {
  final String subjectName;
  final List<ExamResultEntity> examsResults;

  SubjectResultEntity({required this.subjectName, required this.examsResults});
}
