import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';

import '../../../../core/values/app_strings.dart';
import '../../../../core/values/assets.gen.dart';
import '../../domain/entity/exams_entity.dart';

class CustomExamsListItem extends StatelessWidget {
  const CustomExamsListItem({super.key, required this.examModel});
  final ExamEntity examModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouterPaths.kExamDetailsView, extra: examModel);
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.a3dIcons.profit, width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${examModel.title}',
                  style: theme.textTheme.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${examModel.numberOfQuestions} ${AppStrings.question}',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 8),
                Text(AppStrings.timeRange, style: theme.textTheme.labelSmall),
              ],
            ),
            Text(
              '${examModel.duration} ${AppStrings.minutes}',
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
