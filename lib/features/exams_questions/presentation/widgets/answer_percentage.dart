import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/circular_percentage_indicator.dart';

class AnswerPercentage extends StatelessWidget {
  const AnswerPercentage({super.key, required this.corrrectAnswers, required this.wrongAnswers, required this.totalAnswers});
  final int corrrectAnswers ;
  final int wrongAnswers ;
  final int totalAnswers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentageIndicator(
          answers: corrrectAnswers.toDouble(),
          isCorrectAnswer: true,
          totalAnswers: totalAnswers.toDouble(),
        ),
        CircularPercentageIndicator(
          answers:wrongAnswers.toDouble(),
          isCorrectAnswer: false,
          totalAnswers: totalAnswers.toDouble(),
        ),
      ],
    );
  }
}
