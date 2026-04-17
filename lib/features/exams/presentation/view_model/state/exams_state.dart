// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/exams_entity.dart';

@injectable
class ExamsState extends Equatable {
  const ExamsState({this.examsState = const BaseState<List<ExamEntity>>()});
  final BaseState<List<ExamEntity>> examsState;

  ExamsState copyWith({BaseState<List<ExamEntity>>? examsStateParam}) {
    return ExamsState(examsState: examsStateParam ?? examsState);
  }

  @override
  List<Object?> get props => [examsState];
}
