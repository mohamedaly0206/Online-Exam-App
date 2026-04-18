import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';

class SplashState {
  final BaseState<UserEntity> splashState;

  SplashState({BaseState<UserEntity>? splashStateParam})
    : splashState =
          splashStateParam ??
          BaseState<UserEntity>(
            isLoading: false,
            errorMessage: null,
            data: null,
          );

  SplashState copyWith({BaseState<UserEntity>? splashStateParam}) {
    return SplashState(splashStateParam: splashStateParam ?? splashState);
  }
}
