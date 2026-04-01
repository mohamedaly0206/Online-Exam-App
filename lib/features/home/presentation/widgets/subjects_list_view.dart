import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view_model/state/home_states.dart';
import 'package:online_exam_app/features/home/presentation/widgets/subjects_list_view_item.dart';

class SubjectsListView extends StatelessWidget {
  const SubjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state.subjectsListState.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          if (state.subjectsListState.errorMessage != null) {
            return Center(child: Text(state.subjectsListState.errorMessage!));
          }

          final subjects =
              state.filteredSubjects ?? state.subjectsListState.data ?? [];

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            itemCount: subjects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return SubjectsListViewItem(subjectModel: subjects[index]);
            },
          );
        },
      ),
    );
  }
}
