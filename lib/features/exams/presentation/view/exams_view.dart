// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/cubit/exams_cubit.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/intent/exams_intent.dart';

import '../../../../core/values/app_strings.dart';
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
  final examsCubit = getIt.get<ExamsCubit>();
  @override
  initState() {
    super.initState();
    examsCubit.doIntent(GetExamsIntent(subjectId: widget.subjectId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectName),
        leading: Center(
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset(Assets.icons.arrowBackIcon),
          ),
        ),
      ),
      body: BlocBuilder<ExamsCubit, ExamsState>(
        buildWhen: (previous, current) {
          return previous.examsState != current.examsState;
        },
        builder: (context, state) {
          if (state.examsState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.examsState.errorMessage != '' &&
              state.examsState.data != null) {
            return Center(child: Text(state.examsState.errorMessage!));
          } else {
            return ListView.builder(
              itemCount: state.examsState.data?.length ?? 0,
              itemBuilder: (context, index) =>
                  CustomExamsListItem(examModel: state.examsState.data![index]),
            );
          }
        },
      ),
    );
  }
}
