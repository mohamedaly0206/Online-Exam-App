import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model.dart';

class LoginState {
  final BaseState<UserModel> loginState;
  final bool rememberMe;

  LoginState({BaseState<UserModel>? loginState, this.rememberMe = false})
    : loginState =
          loginState ??
          BaseState<UserModel>(
            isLoading: false,
            errorMessage: null,
            data: null,
          );

  LoginState copyWith({
    BaseState<UserModel>? loginStateParam,
    bool? rememberMeParam,
  }) {
    return LoginState(
      loginState: loginStateParam ?? loginState,
      rememberMe: rememberMeParam ?? rememberMe,
    );
  }
}
