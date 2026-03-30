import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/answer_model.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';

class CheckBoxAnswers extends StatelessWidget {
  const CheckBoxAnswers({super.key, required this.answers});
  final AnswerModel answers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        final selected = state.selectedAnswers[state.currentQuestionIndex];

        final isChecked = selected is List<AnswerKey>
            ? selected.contains(answers.answerKey)
            : false;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                answers.answerText,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
              ),
              leading: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  context
                      .read<ExamsQuestionsCubit>()
                      .handleExamsQuestionsIntent(
                        SelectMultipleAnswerIntent(
                          state.currentQuestionIndex,
                          answers.answerKey,
                        ),
                      );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
