import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';

class ExamResultState extends Equatable {
  const ExamResultState({this.examResultsHistoryState = const BaseState()});
  final BaseState<List<SubjectResultEntity>> examResultsHistoryState;

  ExamResultState copyWith({
    BaseState<List<SubjectResultEntity>>? examResultsHistoryStateParam,
  }) {
    return ExamResultState(
      examResultsHistoryState:
          examResultsHistoryStateParam ?? examResultsHistoryState,
    );
  }

  @override
  List<Object?> get props => [examResultsHistoryState];
}
