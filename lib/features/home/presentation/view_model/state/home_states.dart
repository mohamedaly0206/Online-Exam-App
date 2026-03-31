import 'package:online_exam_app/features/home/domain/model/subject_model.dart';
import '../../../../../config/base_state/base_state.dart';

class HomeStates {
  final int currentIndex;
  final BaseState<List<SubjectModel>> subjectsListState;
  final List<SubjectModel>? filteredSubjects;
  HomeStates({
    this.currentIndex = 0,
    BaseState<List<SubjectModel>>? subjectsListState,
    this.filteredSubjects,
  }) : subjectsListState =
           subjectsListState ??
           BaseState<List<SubjectModel>>(isLoading: false, data: []);

  HomeStates copyWith({
    int? currentIndexParam,
    BaseState<List<SubjectModel>>? subjectsListStateParam,
    List<SubjectModel>? filteredSubjectsParam,
  }) {
    return HomeStates(
      currentIndex: currentIndexParam ?? this.currentIndex,
      subjectsListState: subjectsListStateParam ?? this.subjectsListState,
      filteredSubjects: filteredSubjectsParam ?? this.filteredSubjects,
    );
  }
}
