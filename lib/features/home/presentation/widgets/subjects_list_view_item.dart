import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/router/router_paths.dart';
import 'package:online_exam_app/features/exams/domain/entity/subject_request.dart';
import 'package:online_exam_app/features/home/domain/model/subject_entity.dart';

class SubjectsListViewItem extends StatelessWidget {
  const SubjectsListViewItem({super.key, required this.subjectModel});

  final SubjectEntity subjectModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouterPaths.kExamView,
          extra: SubjectRequest(
            subjectId: subjectModel.id,
            subjectName: subjectModel.name,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.only(top: 23, bottom: 23, left: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(subjectModel.icon, height: 55, width: 55),
            const SizedBox(width: 16),
            Text(
              subjectModel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
