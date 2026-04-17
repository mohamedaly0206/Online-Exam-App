// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/model/exams_model.dart';
@injectable
class ExamsState {
  BaseState<List<ExamModel>> examsState = BaseState<List<ExamModel>>(
    isLoading: true,
  );
  ExamsState({BaseState<List<ExamModel>>? examsState}) {
    this.examsState = examsState ?? this.examsState;
  }

  ExamsState copyWith({BaseState<List<ExamModel>>? examsStateParam}) {
    return ExamsState(examsState: examsStateParam ?? examsState);
  }
}
