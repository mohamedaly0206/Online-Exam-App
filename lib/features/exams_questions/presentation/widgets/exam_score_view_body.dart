import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/answer_percentage.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_score_details.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/score_view_body_buttons.dart';

class ExamScoreViewBody extends StatelessWidget {
  const ExamScoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.yourScore,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              AnswerPercentage(),
              const SizedBox(width: 23),
              ExamScoreDetails(),
            ],
          ),
          SizedBox(height: 80),
          ScoreViewBodyButtons(),
        ],
      ),
    );
  }
}
