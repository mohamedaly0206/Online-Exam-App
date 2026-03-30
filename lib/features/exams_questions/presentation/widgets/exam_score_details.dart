import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/answers_score.dart';

class ExamScoreDetails extends StatelessWidget {
  const ExamScoreDetails({super.key, required this.correctAnswers, required this.wrongAnswers});
  final int  correctAnswers;
  final int wrongAnswers;
  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            AnswersScore(
              score:correctAnswers,
              answerKindName: AppStrings.correct,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 8),
            AnswersScore(
              score: wrongAnswers,
              answerKindName: AppStrings.inCorrect,
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        );
      }
  }
