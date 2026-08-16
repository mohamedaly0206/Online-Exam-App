import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

class AnswerQuestionCard extends StatelessWidget {
  final QuestionResultEntity question;

  const AnswerQuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.placeHolderColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          ...List.generate(question.answers.length, (i) {
            final answer = question.answers[i];
            final bool isSelected = question.userAnswerKeys.contains(
              answer.key,
            );
            final bool isCorrect = question.correctAnswerKeys.contains(
              answer.key,
            );
            final bool isWrongSelected = isSelected && !isCorrect;
            final bool isSingleChoice = question.type == 'single_choice';

            Color borderColor = AppColors.transparentColor;
            Color bgColor = Theme.of(context).colorScheme.primaryContainer;
            Color iconColor = Theme.of(context).colorScheme.primary;

            if (isCorrect) {
              borderColor = Theme.of(context).colorScheme.tertiary;
              bgColor = Theme.of(context).colorScheme.tertiaryContainer;
              iconColor = Theme.of(context).colorScheme.tertiary;
            } else if (isWrongSelected) {
              borderColor = Theme.of(context).colorScheme.error;
              bgColor = Theme.of(context).colorScheme.errorContainer;
              iconColor = Theme.of(context).colorScheme.error;
            }

            return Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: isSingleChoice
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      borderRadius: isSingleChoice
                          ? null
                          : BorderRadius.circular(4),
                      color: isSelected
                          ? iconColor
                          : AppColors.transparentColor,
                      border: Border.all(color: iconColor, width: 2),
                    ),
                    child: isSelected
                        ? Icon(
                            isSingleChoice ? Icons.circle : Icons.check,
                            size: isSingleChoice ? 12 : 16,
                            color: AppColors.whiteColor,
                          )
                        : null,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      answer.answer,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
