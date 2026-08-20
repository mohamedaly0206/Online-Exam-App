import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/presentation/widgets/answer_question_card.dart';

class AnswersView extends StatelessWidget {
  final ExamResultEntity examResult;

  const AnswersView({super.key, required this.examResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.answers),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: examResult.questions.length,
        itemBuilder: (context, index) {
          final question = examResult.questions[index];
          return AnswerQuestionCard(question: question);
        },
      ),
    );
  }
}
