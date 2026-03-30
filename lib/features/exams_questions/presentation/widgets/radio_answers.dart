import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/data/models/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/models/answer_model.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';

class RadioAnswers extends StatelessWidget {
  const RadioAnswers({super.key, required this.answers});
  final AnswerModel answers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
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
              leading: RadioGroup<AnswerKey>(
                onChanged: (value) {
                  context
                      .read<ExamsQuestionsCubit>()
                      .handleExamsQuestionsIntent(
                        SelectSingleAnswerIntent(
                          state.currentQuestionIndex,
                          value!,
                        ),
                      );
                },
                groupValue: state.selectedAnswers[state.currentQuestionIndex],

                child: Radio<AnswerKey>(value: answers.answerKey),
              ),
            ),
          ),
        );
      },
    );
  }
}
