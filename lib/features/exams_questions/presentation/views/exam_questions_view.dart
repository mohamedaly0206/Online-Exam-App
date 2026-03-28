import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/intent/exams_questions_intent.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_questions_view_body.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_timer.dart';

class ExamsQuestionsView extends StatelessWidget {
  const ExamsQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExamsQuestionsCubit>(
      create: (context) =>
          getIt<ExamsQuestionsCubit>()
            ..handleExamsQuestionsIntent(StartTimerIntent()),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: AppBar(
                    leading: InkWell(
                      onTap: () {
                        context
                            .read<ExamsQuestionsCubit>()
                            .handleExamsQuestionsIntent(StopTimerIntent());
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.arrowBackIcon),
                      ),
                    ),
                    title: const Text(AppStrings.exam),

                    actions: [ExamTimer()],
                  ),
                ),
              ),
              body: ExamQuestionsViewBody(),
            ),
          );
        },
      ),
    );
  }
}
