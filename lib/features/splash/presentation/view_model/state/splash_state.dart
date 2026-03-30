import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_model.dart';

class SplashState {
  final BaseState<UserModel> splashState;

  SplashState({BaseState<UserModel>? splashStateParam}) : splashState = splashStateParam ?? BaseState<UserModel>(
        isLoading: false,
        errorMessage: null,
        data: null,
      );

  SplashState copyWith({BaseState<UserModel>? splashStateParam}) {
    return SplashState(
      splashStateParam: splashStateParam ?? splashState,
    );
  }
}