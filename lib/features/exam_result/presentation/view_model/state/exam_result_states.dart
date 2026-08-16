import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';

class ExamResultStates extends Equatable {
  final BaseState gettingResultsState;

  const ExamResultStates({this.gettingResultsState = const BaseState()});

  ExamResultStates copyWith({BaseState? gettingResultsState}) {
    return ExamResultStates(
      gettingResultsState: gettingResultsState ?? this.gettingResultsState,
    );
  }

  @override
  List<Object?> get props => [gettingResultsState];
}
