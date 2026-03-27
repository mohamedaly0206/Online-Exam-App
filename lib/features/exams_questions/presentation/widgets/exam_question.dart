import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/multiple_answer_question.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/single_answer_question.dart';

class ExamQuestion extends StatelessWidget {
  const ExamQuestion({super.key});
  final bool isSingleAnswer = true;
  @override
  Widget build(BuildContext context) {
    return isSingleAnswer ? SingleAnswerQuestion() : MultipleAnswerQuestion();
  }
}
