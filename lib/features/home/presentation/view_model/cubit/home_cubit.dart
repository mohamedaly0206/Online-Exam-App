import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/home/domain/use_case/get_subjects_use_case.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../../domain/model/subject_model.dart';
import '../intent/home_intent.dart';
import '../state/home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetSubjectsUseCase _getSubjectsUseCase;

  HomeCubit(this._getSubjectsUseCase) : super(HomeStates());

  void doIntent(HomeIntents intent) {
    switch (intent) {
      case GetAllSubjectsIntent():
        _getAllSubjects();
        break;
      case ChangeTapIntent():
        _changeTab(intent.index);
        break;
      case SearchSubjectsIntent():
        _searchInSubjects(intent.query);
        break;
    }
  }

  void _changeTab(int index) {
    emit(state.copyWith(currentIndexParam: index));
  }

  late final List<SubjectModel>? filteredSubjects;
  late final List<SubjectModel>? allSubjects;

  Future<void> _getAllSubjects() async {
    emit(
      state.copyWith(
        subjectsListStateParam: BaseState(
          isLoading: true,
          data: state.subjectsListState.data,
        ),
      ),
    );

    final result = await _getSubjectsUseCase();

    switch (result) {
      case SuccessBaseResponse<List<SubjectModel>>():
        emit(
          state.copyWith(
            subjectsListStateParam: BaseState(
              isLoading: false,
              data: result.data,
            ),
            filteredSubjectsParam: result.data,
          ),
        );

      case ErrorBaseResponse<List<SubjectModel>>():
        emit(
          state.copyWith(
            subjectsListStateParam: BaseState(
              isLoading: false,
              data: [],
              errorMessage: result.errorMessage,
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
      final filtered = allSubjects.where((subject) {
        return subject.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(state.copyWith(filteredSubjectsParam: filtered));
    }
  }
}
