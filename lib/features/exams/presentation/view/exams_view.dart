import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/cubit/exams_cubit.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/intent/exams_intent.dart';
import '../../../../core/values/assets.gen.dart';
import '../view_model/state/exams_state.dart';
import '../widgets/custom_exams_list_item.dart';

class ExamsView extends StatefulWidget {
  const ExamsView({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });
  final String subjectId;
  final String subjectName;

  @override
  State<ExamsView> createState() => _ExamsViewState();
}

class _ExamsViewState extends State<ExamsView> {
  @override
  initState() {
    super.initState();
    context.read<ExamsCubit>().doIntent(
      GetExamsIntent(subjectId: widget.subjectId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.subjectName),
      body: BlocBuilder<ExamsCubit, ExamsState>(
        buildWhen: (previous, current) {
          return previous.examsState != current.examsState;
        },
        builder: (context, state) {
          final errorMessage = state.examsState.errorMessage;
          final data = state.examsState.data;
          if (state.examsState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (errorMessage != null && errorMessage.isNotEmpty == true) {
            return Center(child: Text(errorMessage));
          } else if (data != null) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  CustomExamsListItem(examModel: data[index]),
            );
          } else {
            return Center(child: Text(AppStrings.noExamsAvailable));
          }
        },
      ),
    );
  }
}
