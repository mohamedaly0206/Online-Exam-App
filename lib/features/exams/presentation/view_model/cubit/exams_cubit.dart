import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams/domain/model/exams_model.dart';
import 'package:online_exam_app/features/exams/domain/use_case/get_exams_by_category_use_case.dart';
import 'package:online_exam_app/features/exams/presentation/view_model/state/exams_state.dart';
import '../../../../../config/base_response/base_response.dart';
import '../intent/exams_intent.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit({required this.getExamsByCategoryUseCase}) : super(ExamsState());
  final GetExamsByCategoryUseCase getExamsByCategoryUseCase;

  void doIntent(ExamsIntent intent) {
    switch (intent) {
      case GetExamsIntent():
        _getExams();
        break;
    }
  }

  Future<void> _getExams() async {
    emit(
      state.copyWith(
        examsStateParam: state.examsState.copyWith(isLoadingParam: true),
      ),
    );
    //! you should pass subjectId, but there is an wrong in the api
    final response = await getExamsByCategoryUseCase(
      // subjectId: null,
    );
    switch (response) {
      case SuccessBaseResponse<List<ExamModel>>():
        emit(
          state.copyWith(
            examsStateParam: state.examsState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<List<ExamModel>>():
        emit(
          state.copyWith(
            examsStateParam: state.examsState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }
}
