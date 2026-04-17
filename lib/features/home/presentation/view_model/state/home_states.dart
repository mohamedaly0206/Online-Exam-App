import 'package:online_exam_app/features/home/domain/model/subject_entity.dart';
import '../../../../../config/base_state/base_state.dart';

class HomeStates {
  final int currentIndex;
  final BaseState<List<SubjectEntity>> subjectsListState;
  final List<SubjectEntity>? filteredSubjects;
  HomeStates({
    this.currentIndex = 0,
    BaseState<List<SubjectEntity>>? subjectsListState,
    this.filteredSubjects,
  }) : subjectsListState =
           subjectsListState ??
           BaseState<List<SubjectEntity>>(isLoading: false, data: []);

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
}
