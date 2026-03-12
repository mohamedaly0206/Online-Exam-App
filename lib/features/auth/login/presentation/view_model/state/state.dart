import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model.dart';

class LoginState {
  BaseState<UserModel> loginState = BaseState<UserModel>();

  LoginState({BaseState<UserModel>? loginState}) {
    this.loginState = loginState ?? this.loginState;
  }

  LoginState copyWith({BaseState<UserModel>? loginStateParam}) {
    return LoginState(
      loginState: loginStateParam ?? loginState,
    );
  }
}