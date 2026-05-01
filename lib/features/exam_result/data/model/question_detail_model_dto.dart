import 'package:hive_ce/hive_ce.dart';
import 'package:online_exam_app/features/exam_result/data/model/question_option_model_dto.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/question_detail_entity.dart';

part 'question_detail_model_dto.g.dart';

@HiveType(typeId: 1)
class QuestionDetailModelDTO extends HiveObject {
  @HiveField(0)
  final String questionTitle;
  @HiveField(1)
  final List<QuestionOptionModelDTO> options;
  @HiveField(2)
  final bool isMultipleChoice;

  QuestionDetailModelDTO({
    required this.questionTitle,
    required this.options,
    required this.isMultipleChoice,
  });

  QuestionDetailEntity toDomain() {
    return QuestionDetailEntity(
      questionTitle: questionTitle,
      options: options.map((o) => o.toDomain()).toList(),
      isMultipleChoice: isMultipleChoice,
    );
  }

  factory QuestionDetailModelDTO.fromDomain(QuestionDetailEntity entity) {
    return QuestionDetailModelDTO(
      questionTitle: entity.questionTitle,
      options: entity.options
          .map((o) => QuestionOptionModelDTO.fromDomain(o))
          .toList(),
      isMultipleChoice: entity.isMultipleChoice,
    );
  }
}
