import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/dialogs/show_dialog.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/cubit/exam_result_cubit.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/intent/exam_result_intent.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';

class BackAndNextButtons extends StatefulWidget {
  const BackAndNextButtons({super.key, required this.examId});
  final String examId;
  @override
  State<BackAndNextButtons> createState() => _BackAndNextButtonsState();
}

class _BackAndNextButtonsState extends State<BackAndNextButtons> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final examsQuestionsCubit = context.read<ExamsQuestionsCubit>();
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    theme.colorScheme.onSecondary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  examsQuestionsCubit.handleExamsQuestionsIntent(
                    PreviousQuestionIntent(),
                  );
                },
                child: Text(
                  AppStrings.backButton,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  state.totalQuestions - 1 == state.currentQuestionIndex
                      ? showFinishDialog(context, () {
                          examsQuestionsCubit.handleExamsQuestionsIntent(
                            SubmitQuestionIntent(),
                          );
                          if (!context.mounted) return;
                          GoRouter.of(context).pushReplacement(
                            AppRouterPaths.kExamScoreView,
                            extra: {
                              AppStrings.examId: widget.examId,
                              AppStrings.correctAnswers:
                                  examsQuestionsCubit.state.totalCorrectAnswers,
                              AppStrings.wrongAnswers:
                                  examsQuestionsCubit.state.totalWrongAnswers,
                              AppStrings.totalAnswers:
                                  examsQuestionsCubit.state.totalQuestions,
                              AppStrings.examResults: examsQuestionsCubit
                                  .getExamResult(),
                            },
                          );
                        })
                      : examsQuestionsCubit.handleExamsQuestionsIntent(
                          NextQuestionIntent(),
                        );
                },
                child: Text(
                  state.totalQuestions - 1 == state.currentQuestionIndex
                      ? AppStrings.finishButton
                      : AppStrings.nextButton,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
