import 'package:flutter/material.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import '../../domain/entity/exams_entity.dart';
import '../widgets/exam_details_body.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({super.key, required this.exam});
  final ExamEntity exam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ExamDetailsBody(exam: exam),
    );
  }
}
