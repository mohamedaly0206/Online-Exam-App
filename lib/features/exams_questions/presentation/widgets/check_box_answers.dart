import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/answer_entity.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';

class CheckBoxAnswers extends StatelessWidget {
  const CheckBoxAnswers({super.key, required this.answer});
  final AnswerEntity answer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        final selected = state.selectedAnswers[state.currentQuestionIndex];

        final isChecked = selected is List<AnswerKey>
            ? selected.contains(answer.answerKey)
            : false;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color: isChecked
                  ? Theme.of(context).colorScheme.onTertiaryFixed
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                answer.answerText,
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
                          answer.answerKey,
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
