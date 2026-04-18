import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/splash/presentation/view_model/state/splash_state.dart';

import '../../../../../config/models/user_model/user_entity.dart';

import '../../../../auth/login/domain/use_cases/check_user_logged_in_use_case.dart';
import '../../../../auth/login/domain/use_cases/get_logged_user_info_use_case.dart';
import '../intent/splash_intent.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final CheckUserLoggedInUseCase _checkUserLoggedInUseCase;
  final GetLoggedUserInfoUseCase _getLoggedUserInfoUseCase;

  SplashCubit(this._checkUserLoggedInUseCase, this._getLoggedUserInfoUseCase)
    : super(SplashState());

  void doIntent(SplashIntent intent) {
    switch (intent) {
      case CheckSessionIntent():
        _checkSession();
        break;
    }
  }

  Future<void> _checkSession() async {
    emit(state.copyWith(splashStateParam: BaseState(isLoading: true)));

    final isLoggedIn = await _checkUserLoggedInUseCase();

    if (isLoggedIn) {
      final response = await _getLoggedUserInfoUseCase();

      if (response is SuccessBaseResponse<UserEntity>) {
        emit(
          state.copyWith(
            splashStateParam: BaseState(isLoading: false, data: response.data),
          ),
        );
      } else if (response is ErrorBaseResponse<UserEntity>) {
        emit(
          state.copyWith(
            splashStateParam: BaseState(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          splashStateParam: BaseState(
            isLoading: false,
            errorMessage: "no_session",
          ),
        ),
      );
    }
  }
}
