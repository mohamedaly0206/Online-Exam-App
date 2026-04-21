import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/home/domain/use_case/get_subjects_use_case.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../../domain/model/subject_entity.dart';
import '../intent/home_intent.dart';
import '../state/home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetSubjectsUseCase _getSubjectsUseCase;

  HomeCubit(this._getSubjectsUseCase) : super(const HomeStates());

  void doIntent(HomeIntents intent) {
    switch (intent) {
      case GetAllSubjectsIntent():
        _getAllSubjects();
      case ChangeTapIntent():
        _changeTab(intent.index);
      case SearchSubjectsIntent():
        _searchInSubjects(intent.query);
    }
  }

  void _changeTab(int index) {
    emit(state.copyWith(currentIndexParam: index));
  }

  Future<void> _getAllSubjects() async {
    emit(
      state.copyWith(
        subjectsListStateParam: state.subjectsListState.copyWith(
          isLoadingParam: true,
          errorMessageParam: '',
        ),
      ),
    );

    final result = await _getSubjectsUseCase();
    switch (result) {
      case SuccessBaseResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectsListStateParam: state.subjectsListState.copyWith(
              isLoadingParam: false,
              dataParam: result.data,
              errorMessageParam: '',
            ),
            filteredSubjectsParam: result.data,
          ),
        );

      case ErrorBaseResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectsListStateParam: state.subjectsListState.copyWith(
              isLoadingParam: false,
              errorMessageParam: result.errorMessage,
            ),
            filteredSubjectsParam: [],
          ),
        );
    }
  }

  void _searchInSubjects(String query) {
    final allSubjects = state.subjectsListState.data ?? [];

    if (query.isEmpty) {
      emit(state.copyWith(filteredSubjectsParam: allSubjects));
    } else {
      final filtered = allSubjects
          .where(
            (subject) =>
                subject.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      emit(state.copyWith(filteredSubjectsParam: filtered));
    }
  }
}
