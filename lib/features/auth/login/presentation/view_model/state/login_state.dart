import 'package:equatable/equatable.dart'; // 1. استيراد المكتبة
import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_entity.dart';

class LoginState extends Equatable {
  final BaseState<UserEntity> loginState;
  final bool rememberMe;

  const LoginState({
    this.loginState = const BaseState<UserEntity>(),
    this.rememberMe = false,
  });

  LoginState copyWith({
    BaseState<UserEntity>? loginStateParam,
    bool? rememberMeParam,
  }) {
    return LoginState(
      loginState: loginStateParam ?? loginState,
      rememberMe: rememberMeParam ?? rememberMe,
    );
  }

  @override
  List<Object?> get props => [loginState, rememberMe];
}
