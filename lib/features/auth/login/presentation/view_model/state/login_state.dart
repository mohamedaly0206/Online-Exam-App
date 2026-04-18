import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';

class LoginState {
  final BaseState<UserEntity> loginState;

  LoginState({BaseState<UserEntity>? loginState})
    : loginState =
          loginState ??
          BaseState<UserEntity>(
            isLoading: false,
            errorMessage: null,
            data: null,
          );

  LoginState copyWith({BaseState<UserEntity>? loginStateParam}) {
    return LoginState(loginState: loginStateParam ?? loginState);
  }
}
