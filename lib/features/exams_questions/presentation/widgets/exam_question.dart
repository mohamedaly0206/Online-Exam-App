import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/data/models/question_dto.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/multiple_answer_question.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/single_answer_question.dart';

class ExamQuestion extends StatelessWidget {
  const ExamQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state
                  .examsQuestionsState
                  .data!
                  .questions[state.currentQuestionIndex]
                  .question,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 3,
            ),
            SizedBox(height: 24),
            state
                        .examsQuestionsState
                        .data!
                        .questions[state.currentQuestionIndex]
                        .type ==
                    QuestionType.singleChoice
                ? SingleAnswerQuestion(
                    examQuestionModel: state.examsQuestionsState.data!,
                  )
                : MultipleAnswerQuestion(
                    examQuestionModel: state.examsQuestionsState.data!,
                  ),
            state.answerValidation == false
                ? Text(
                    AppStrings.unSelectedAnswerMessage,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
      buildWhen: (prev, curr) =>
          prev.currentQuestionIndex != curr.currentQuestionIndex ||
          prev.answerValidation != curr.answerValidation,
    );
  }
}
