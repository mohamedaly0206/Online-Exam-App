import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exams/domain/entity/exams_entity.dart';
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
        _getExams(intent.subjectId);
        break;
    }
  }

  Future<void> _getExams(String subjectId) async {
    emit(
      state.copyWith(
        examsStateParam: state.examsState.copyWith(isLoadingParam: true),
      ),
    );
    final response = await getExamsByCategoryUseCase(subjectId: subjectId);
    switch (response) {
      case SuccessBaseResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            examsStateParam: state.examsState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<List<ExamEntity>>():
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
