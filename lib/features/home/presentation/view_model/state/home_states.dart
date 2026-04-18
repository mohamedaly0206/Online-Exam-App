import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/home/domain/model/subject_entity.dart';
import '../../../../../config/base_state/base_state.dart';

class HomeStates extends Equatable {
  final int currentIndex;
  final BaseState<List<SubjectEntity>> subjectsListState;
  final List<SubjectEntity>? filteredSubjects;

  const HomeStates({
    this.currentIndex = 0,
    this.subjectsListState = const BaseState<List<SubjectEntity>>(
      isLoading: false,
      data: [],
    ),
    this.filteredSubjects,
  });

  HomeStates copyWith({
    int? currentIndexParam,
    BaseState<List<SubjectEntity>>? subjectsListStateParam,
    List<SubjectEntity>? filteredSubjectsParam,
  }) {
    return HomeStates(
      currentIndex: currentIndexParam ?? this.currentIndex,
      subjectsListState: subjectsListStateParam ?? this.subjectsListState,
      filteredSubjects: filteredSubjectsParam ?? this.filteredSubjects,
    );
  }

  @override
  List<Object?> get props => [
    currentIndex,
    subjectsListState,
    filteredSubjects,
  ];
}
