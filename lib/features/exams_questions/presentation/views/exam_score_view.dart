import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_score_view_body.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key, required this.cubit});
  final ExamsQuestionsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<ExamsQuestionsCubit, ExamsQuestionsState>(
        builder: (context, state) {
          log(
            'correct answers:${state.totalCorrectAnswers} wrong answers:${state.totalWrongAnswers}, total questions:${state.totalQuestions}',
          );
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
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.arrowBackIcon),
                      ),
                    ),
                    title: const Text(AppStrings.examScore),
                  ),
                ),
              ),
              body: ExamScoreViewBody(
                correctAnswers: state.totalCorrectAnswers,
                wrongAnswers: state.totalWrongAnswers,
                totalQuestions: state.totalQuestions,
              ),
            ),
          );
        },
      ),
    );
  }
}
