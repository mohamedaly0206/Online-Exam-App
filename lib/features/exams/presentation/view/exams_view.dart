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

class ExamsView extends StatelessWidget {
  ExamsView({super.key, this.subjectId});
  final String? subjectId;
  final examsCubit = getIt.get<ExamsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExamsCubit>(
      create: (context) => examsCubit..doIntent(GetExamsIntent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.language),
          leading: Center(
            child: GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: SvgPicture.asset(Assets.icons.arrowBackIcon),
            ),
          ),
        ),
        body: BlocBuilder<ExamsCubit, ExamsState>(
          buildWhen: (previous, current) {
            return previous.examsState.isLoading !=
                    current.examsState.isLoading ||
                previous.examsState.errorMessage !=
                    current.examsState.errorMessage ||
                previous.examsState.data != current.examsState.data;
          },
          builder: (context, state) {
            if (state.examsState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.examsState.errorMessage != null) {
              return Center(child: Text(state.examsState.errorMessage!));
            }
            return ListView.builder(
              itemCount: state.examsState.data!.length,
              itemBuilder: (context, index) =>
                  CustomExamsListItem(examModel: state.examsState.data![index]),
            );
          },
        ),
      ),
    );
  }
}
