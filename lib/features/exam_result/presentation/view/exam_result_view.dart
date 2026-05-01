import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/cubit/exam_result_cubit.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/state/exam_result_state.dart';
import 'package:online_exam_app/features/exam_result/presentation/widgets/custom_exam_results_list_item.dart';

class ExamResultView extends StatelessWidget {
  const ExamResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamResultCubit, ExamResultState>(
      builder: (context, state) {
        final subjects = state.examResultsHistoryState.data;
        if (subjects == null || subjects.isEmpty) {
          return Center(child: Text(AppStrings.youHaveNotTakeAnyExamYet));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 40,
                bottom: 0,
              ),
              child: Text(
                AppStrings.examResults,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, position) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          subjects[position].subjectName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: subjects[position].examsResults.length,
                        itemBuilder: (context, index) =>
                            CustomExamResultsListItem(
                              examResultEntity:
                                  subjects[position].examsResults[index],
                            ),
                      ),
                      SizedBox(height: 28),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
