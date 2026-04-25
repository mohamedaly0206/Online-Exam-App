import 'package:online_exam_app/features/exam_result/domain/entity/question_option_entity.dart';

class QuestionDetailEntity {
  final String questionTitle;
  final List<QuestionOptionEntity> options;
  final bool isMultipleChoice;

  QuestionDetailEntity({
    required this.questionTitle,
    required this.options,
    required this.isMultipleChoice,
  });
}
