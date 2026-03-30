import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/quit_exam_alert_dialog.dart';

class BackAndNextButtons extends StatelessWidget {
  const BackAndNextButtons({super.key});
  @override
  Widget build(BuildContext context) {
    final ExamsQuestionsCubit examsQuestionsCubit = context
        .read<ExamsQuestionsCubit>();
    return BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onSecondary,
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
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
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
                  final cubit = context.read<ExamsQuestionsCubit>();
                  state.totalQuestions - 1 == state.currentQuestionIndex
                      ? showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => QuitExamAlertDialog(
                            onPositivePressed: () {
                              cubit.handleExamsQuestionsIntent(
                                SubmitQuestionIntent(),
                              );
                              GoRouter.of(context).pushReplacement(
                                AppRouterPaths.kexamScoreView,
                                extra: cubit,
                              );
                            },
                            posButtonColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            title: AppStrings.finishExam,
                            contentMessage: AppStrings.finishExamMessage,
                            positiveButtonText: AppStrings.viewScore,
                            negativeButtonText: AppStrings.cancel,
                          ),
                        )
                      : examsQuestionsCubit.handleExamsQuestionsIntent(
                          NextQuestionIntent(),
                        );
                  // GoRouter.of(context).push(AppRouterPaths.kexamScoreView);
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
