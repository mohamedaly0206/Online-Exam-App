import 'package:online_exam_app/features/home/domain/model/subject_model.dart';
import '../../../../../config/base_state/base_state.dart';

class HomeStates {
  final int currentIndex;
  final BaseState<List<SubjectModel>> subjectsListState;

  HomeStates({
    this.currentIndex = 0,
    BaseState<List<SubjectModel>>? subjectsListState,
  }) : subjectsListState =
           subjectsListState ??
           BaseState<List<SubjectModel>>(isLoading: false, data: []);

  HomeStates copyWith({
    int? currentIndexParam,
    BaseState<List<SubjectModel>>? subjectsListStateParam,
  }) {
    return HomeStates(
      currentIndex: currentIndexParam ?? this.currentIndex,
      subjectsListState: subjectsListStateParam ?? this.subjectsListState,
    );
  }
}
