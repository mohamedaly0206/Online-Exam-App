import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/use_case/get_exams_results_history_use_case.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/intent/exam_result_intent.dart';
import 'package:online_exam_app/features/exam_result/presentation/view_model/state/exam_result_state.dart';

@injectable
class ExamResultCubit extends Cubit<ExamResultState> {
  final GetExamsResultsHistoryUseCase getExamResultsHistoryUseCase;

  ExamResultCubit({required this.getExamResultsHistoryUseCase})
    : super(ExamResultState());

  Future<void> onIntent(ExamResultIntent intent) async {
    if (intent is GetExamResultsHistoryIntent) {
      await _getExamResultsHistory();
    }
  }

  Future<void> _getExamResultsHistory() async {
    emit(
      state.copyWith(
        examResultsHistoryStateParam: state.examResultsHistoryState.copyWith(
          isLoadingParam: true,
          errorMessageParam: '',
        ),
      ),
    );
    final result = await getExamResultsHistoryUseCase();
    switch (result) {
      case SuccessBaseResponse<List<SubjectResultEntity>>():
        emit(
          state.copyWith(
            examResultsHistoryStateParam: state.examResultsHistoryState
                .copyWith(isLoadingParam: false, dataParam: result.data),
          ),
        );
        break;
      case ErrorBaseResponse<List<SubjectResultEntity>>():
        emit(
          state.copyWith(
            examResultsHistoryStateParam: state.examResultsHistoryState
                .copyWith(
                  isLoadingParam: false,
                  errorMessageParam: result.errorMessage,
                ),
          ),
        );
        break;
    }
  }
}
