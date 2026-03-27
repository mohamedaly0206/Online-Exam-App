import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/radio_answers.dart';

class SingleAnswerQuestion extends StatelessWidget {
  const SingleAnswerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => const RadioAnswers(),
        ),
      ],
    );
  }
}
