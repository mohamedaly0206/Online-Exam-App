import 'package:flutter/material.dart';
import 'package:online_exam_app/features/home/presentation/widgets/subjects_list_view_item.dart';

class SubjectsListView extends StatelessWidget {
  const SubjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 12,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => SubjectsListViewItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
