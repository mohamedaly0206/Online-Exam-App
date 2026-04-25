import 'package:hive/hive.dart';
import 'package:online_exam_app/features/exam_result/data/model/exam_result_model_dto.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';

@HiveType(typeId: 3)
class SubjectResultModelDTO extends HiveObject {
  @HiveField(0)
  final String subjectName;
  @HiveField(1)
  final List<ExamResultModelDTO> examsResults;

  SubjectResultModelDTO({
    required this.subjectName,
    required this.examsResults,
  });

  SubjectResultEntity toDomain() {
    return SubjectResultEntity(
      subjectName: subjectName,
      examsResults: examsResults.map((e) => e.toDomain()).toList(),
    );
  }

  factory SubjectResultModelDTO.fromDomain(SubjectResultEntity entity) {
    return SubjectResultModelDTO(
      subjectName: entity.subjectName,
      examsResults: entity.examsResults
          .map((e) => ExamResultModelDTO.fromDomain(e, entity.subjectName))
          .toList(),
    );
  }
}
