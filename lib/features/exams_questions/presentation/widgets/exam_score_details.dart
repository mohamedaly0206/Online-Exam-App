import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/answers_score.dart';

class ExamScoreDetails extends StatelessWidget {
  const ExamScoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AnswersScore(
            score: 28,
            answerKindName: AppStrings.correct,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 8),
          AnswersScore(
            score: 2,
            answerKindName: AppStrings.inCorrect,
            color: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}
