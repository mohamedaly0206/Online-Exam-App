import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/widgets/dialogs/show_dialog.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_questions_view_body.dart';
import 'package:online_exam_app/features/exams_questions/presentation/widgets/exam_timer_widget.dart';

class ExamsQuestionsView extends StatelessWidget {
  const ExamsQuestionsView({super.key, required this.examId});
  final String examId;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            showQuitExamDialog(context);
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: AppStrings.exam,
              actions: const [ExamTimerWidget()],
              onBackPressed: () {
                showQuitExamDialog(context);
              },
            ),
            body: ExamQuestionsViewBody(examId: examId),
          ),
        );
      },
    );
  }
}
