import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exam_result/domain/entities/exam_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/exam_result_repo.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/intent/exam_result_intent.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/state/exam_result_states.dart';

@injectable
class ExamResultCubit extends Cubit<ExamResultStates> {
  final ExamResultRepo _repo;
  ExamResultCubit(this._repo) : super(const ExamResultStates());

void handleExamResultsIntent(ExamResultIntent intent) {
   switch (intent) {
      case GetResultsIntent():
        _getResults();
        break;
    }
  }
  void _getResults() async {
    emit(state.copyWith(gettingResultsState: const BaseState(isLoading: true)));
    final result = await _repo.getResults();
    switch (result) {
      case SuccessBaseResponse<List<ExamResultEntity>>():
        emit(
          state.copyWith(
            gettingResultsState: BaseState(isLoading: false, data: result.data),
          ),
        );
      case ErrorBaseResponse<List<ExamResultEntity>>():
        emit(
          state.copyWith(
            gettingResultsState: const BaseState(
              isLoading: false,
              errorMessage: "Failed to fetch results",
            ),
          ),
        );
    }
  }
}
