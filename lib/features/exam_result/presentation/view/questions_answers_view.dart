import 'package:flutter/material.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/presentation/widgets/quiz_option_card.dart';
import 'package:online_exam_app/features/exams/domain/entity/exams_entity.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/radio_answers.dart';

class QuestionsAnswersView extends StatelessWidget {
  const QuestionsAnswersView({super.key, required this.exam});
  final ExamResultEntity exam;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: exam.examTitle),
      body: ListView.builder(
        itemCount: exam.questions.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: theme.colorScheme.secondary, blurRadius: 8),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.questions[index].questionTitle,
                style: theme.textTheme.titleMedium,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: exam.questions[index].options.length,
                itemBuilder: (context, oIndex) => QuizOptionCard(
                  text: exam.questions[index].options[oIndex].optionText,
                  isSelected: exam.questions[index].options[oIndex].isSelected,
                  isCorrect: exam.questions[index].options[oIndex].isCorrect,
                  isMultipleChoice: exam.questions[index].isMultipleChoice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
