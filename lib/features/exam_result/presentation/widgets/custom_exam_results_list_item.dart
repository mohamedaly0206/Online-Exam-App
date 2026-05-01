import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';

class CustomExamResultsListItem extends StatelessWidget {
  const CustomExamResultsListItem({super.key, required this.examResultEntity});
  final ExamResultEntity examResultEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouterPaths.kQuestionsAnswersView, extra: examResultEntity);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: theme.colorScheme.secondary, blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            Image.asset(Assets.a3dIcons.profit.path, width: 60),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              examResultEntity.examTitle,
                              style: theme.textTheme.headlineMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${examResultEntity.totalQuestions} ${AppStrings.question}',
                              style: theme.textTheme.headlineSmall!.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${int.parse(examResultEntity.duration)} ${AppStrings.minutes}',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${examResultEntity.correctAnswers} ${AppStrings.correctedAnswersIn} ${int.parse(examResultEntity.duration) ~/ 60} ${AppStrings.min}',
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
