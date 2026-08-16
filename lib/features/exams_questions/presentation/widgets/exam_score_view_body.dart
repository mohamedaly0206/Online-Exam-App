import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/answer_percentage_widget.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_score_details.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/score_view_body_buttons.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

class ExamScoreViewBody extends StatelessWidget {
  const ExamScoreViewBody({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalQuestions,
    required this.examId,
    required this.examResult,
  });
  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;
  final String examId;
  final ExamResultEntity examResult;

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
              Expanded(
                flex: 2,
                child: AnswerPercentageWidget(
                  correctAnswers: correctAnswers,
                  wrongAnswers: wrongAnswers,
                  totalAnswers: totalQuestions,
                ),
              ),
              const SizedBox(width: 23),
              Expanded(
                flex: 2,
                child: ExamScoreDetails(
                  correctAnswers: correctAnswers,
                  wrongAnswers: wrongAnswers,
                ),
              ),
            ],
          ),
          SizedBox(height: 80),
          ScoreViewBodyButtons(examId: examId, examResult: examResult),
        ],
      ),
    );
  }
}
