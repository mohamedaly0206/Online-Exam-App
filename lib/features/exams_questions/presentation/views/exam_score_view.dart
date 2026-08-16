import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_score_view_body.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({
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
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.examScore),
        body: ExamScoreViewBody(
          correctAnswers: correctAnswers,
          wrongAnswers: wrongAnswers,
          totalQuestions: totalQuestions,
          examId: examId,
          examResult: examResult,
        ),
      ),
    );
  }
}
