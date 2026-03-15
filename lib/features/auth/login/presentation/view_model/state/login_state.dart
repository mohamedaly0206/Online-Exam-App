import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model.dart';

class LoginState {
  final BaseState<UserModel> loginState;

  LoginState({BaseState<UserModel>? loginState})
    : loginState =
          loginState ??
          BaseState<UserModel>(
            isLoading: false,
            errorMessage: null,
            data: null,
          );

  LoginState copyWith({BaseState<UserModel>? loginStateParam}) {
    return LoginState(loginState: loginStateParam ?? loginState);
  }
}
