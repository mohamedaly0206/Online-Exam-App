import 'package:flutter/material.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/check_box_answers.dart';

class MultipleAnswerQuestion extends StatelessWidget {
  const MultipleAnswerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => const CheckBoxAnswers(),
        ),
      ],
    );
  }
}
