import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';

class LoginState {
  final BaseState<UserEntity> loginState;
  final bool rememberMe;

  LoginState({BaseState<UserEntity>? loginState, this.rememberMe = false})
    : loginState =
          loginState ??
          BaseState<UserEntity>(
            isLoading: false,
            errorMessage: null,
            data: null,
          );

  LoginState copyWith({
    BaseState<UserEntity>? loginStateParam,
    bool? rememberMeParam,
  }) {
    return LoginState(
      loginState: loginStateParam ?? loginState,
      rememberMe: rememberMeParam ?? rememberMe,
    );
  }
}
