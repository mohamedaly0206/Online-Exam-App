import 'package:hive_ce/hive_ce.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/question_option_entity.dart';

part 'question_option_model_dto.g.dart';

@HiveType(typeId: 2)
class QuestionOptionModelDTO extends HiveObject {
  @HiveField(0)
  final String optionText;
  @HiveField(1)
  final bool isSelected;
  @HiveField(2)
  final bool isCorrect;

  QuestionOptionModelDTO({
    required this.optionText,
    required this.isSelected,
    required this.isCorrect,
  });

  QuestionOptionEntity toDomain() {
    return QuestionOptionEntity(
      optionText: optionText,
      isSelected: isSelected,
      isCorrect: isCorrect,
    );
  }

  factory QuestionOptionModelDTO.fromDomain(QuestionOptionEntity entity) {
    return QuestionOptionModelDTO(
      optionText: entity.optionText,
      isSelected: entity.isSelected,
      isCorrect: entity.isCorrect,
    );
  }
}
