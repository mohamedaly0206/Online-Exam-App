import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/cubit/exam_result_cubit.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/intent/exam_result_intent.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/state/exam_result_states.dart';
import 'package:online_exam_app/features/exam_result/presentation/widgets/result_exam_card.dart';
import 'package:online_exam_app/features/home/domain/model/subject_entity.dart';
import 'package:online_exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view_model/state/home_states.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExamResultCubit>()..handleExamResultsIntent(GetResultsIntent()),
      child: BlocListener<HomeCubit, HomeStates>(
        listenWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex &&
            current.currentIndex == 1,
        listener: (context, state) {
          context.read<ExamResultCubit>().handleExamResultsIntent(
            GetResultsIntent(),
          );
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  AppStrings.result,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: BlocBuilder<ExamResultCubit, ExamResultStates>(
                    builder: (context, state) {
                      if (state.gettingResultsState.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        );
                      }
                      if (state.gettingResultsState.errorMessage != null &&
                          state.gettingResultsState.errorMessage!.isNotEmpty) {
                        return Center(
                          child: Text(state.gettingResultsState.errorMessage!),
                        );
                      }
                      final results = [
                        ...(state.gettingResultsState.data ?? []),
                      ]..sort((a, b) => b.submittedAt.compareTo(a.submittedAt));
                      if (results.isEmpty) {
                        return const Center(
                          child: Text(AppStrings.noExamsAvailable),
                        );
                      }

                      final subjects = context
                          .read<HomeCubit>()
                          .state
                          .subjectsListState
                          .data;
                      final Map<String, List<ExamResultEntity>> groupedResults =
                          {};
                      for (var result in results) {
                        final subject = _subjectNameFor(result, subjects);
                        if (!groupedResults.containsKey(subject)) {
                          groupedResults[subject] = [];
                        }
                        groupedResults[subject]!.add(result);
                      }

                      return ListView.builder(
                        padding: EdgeInsets.only(bottom: 24),
                        itemCount: groupedResults.length,
                        itemBuilder: (context, index) {
                          final subject = groupedResults.keys.elementAt(index);
                          final subjectResults = groupedResults[subject]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  subject,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ...subjectResults.map((result) {
                                return ResultExamCard(
                                  examResult: result,
                                  onTap: () {
                                    context.push(
                                      AppRouterPaths.kAnswersView,
                                      extra: result,
                                    );
                                  },
                                );
                              }),
                              SizedBox(height: 28),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _subjectNameFor(
    ExamResultEntity result,
    List<SubjectEntity>? subjects,
  ) {
    final fallback = result.subjectName.isNotEmpty
        ? result.subjectName
        : 'Other';
    if (subjects == null) return fallback;

    for (final subject in subjects) {
      if (subject.id == result.subjectName) return subject.name;
    }

    return fallback;
  }
}
