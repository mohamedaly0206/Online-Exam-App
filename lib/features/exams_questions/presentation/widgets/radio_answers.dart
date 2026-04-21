import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exams_questions/data/models/response_dto/answer_dto.dart';
import 'package:online_exam_app/features/exams_questions/domain/entities/answer_entity.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';

class RadioAnswers extends StatelessWidget {
  const RadioAnswers({super.key, required this.answers});
  final AnswerEntity answers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color:
                  state.selectedAnswers[state.currentQuestionIndex] ==
                      answers.answerKey
                  ? Theme.of(context).colorScheme.onTertiaryFixed
                  : Theme.of(context).colorScheme.primaryContainer,
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
