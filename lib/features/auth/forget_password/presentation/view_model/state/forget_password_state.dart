import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  final BaseState<bool> enterEmailState;
  final BaseState<bool> resendOTPState;
  final BaseState<bool> resetPasswordState;
  final BaseState<bool> verifyResetCodeState;

  const ForgetPasswordState({
    this.enterEmailState = const BaseState<bool>(),
    this.resetPasswordState = const BaseState<bool>(),
    this.verifyResetCodeState = const BaseState<bool>(),
    this.resendOTPState = const BaseState<bool>(),
  });

  ForgetPasswordState copyWith({
    BaseState<bool>? enterEmailStateParam,
    BaseState<bool>? resetPasswordStateParam,
    BaseState<bool>? verifyResetCodeStateParam,
    BaseState<bool>? resendOTPStateParam,
  }) {
    return ForgetPasswordState(
      enterEmailState: enterEmailStateParam ?? enterEmailState,
      resetPasswordState: resetPasswordStateParam ?? resetPasswordState,
      verifyResetCodeState: verifyResetCodeStateParam ?? verifyResetCodeState,
      resendOTPState: resendOTPStateParam ?? resendOTPState,
    );
  }

  @override
  List<Object?> get props => [
    enterEmailState,
    resetPasswordState,
    verifyResetCodeState,
    resendOTPState,
  ];
}
