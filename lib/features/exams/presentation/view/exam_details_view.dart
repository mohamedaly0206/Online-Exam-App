import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/values/assets.gen.dart';
import '../../domain/entity/exams_entity.dart';
import '../widgets/exam_details_body.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({super.key, required this.exam});
  final ExamEntity exam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset(Assets.icons.arrowBackIcon),
          ),
        ),
      ),
      body: ExamDetailsBody(exam: exam),
    );
  }
}
