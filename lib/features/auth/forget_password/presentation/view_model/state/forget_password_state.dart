import 'package:online_exam_app/config/base_state/base_state.dart';

class ForgetPasswordState {
  BaseState<bool> enterEmailState = BaseState<bool>();
  BaseState<bool> resendOTPState = BaseState<bool>();
  BaseState<bool> resetPasswordState = BaseState<bool>();
  BaseState<bool> verifyResetCodeState = BaseState<bool>();

  ForgetPasswordState({
    BaseState<bool>? enterEmailState,
    BaseState<bool>? resetPasswordState,
    BaseState<bool>? verifyResetCodeState,
    BaseState<bool>? resendOTPState,
  }) {
    this.enterEmailState = enterEmailState ?? this.enterEmailState;
    this.resendOTPState = resendOTPState ?? this.resendOTPState;
    this.resetPasswordState = resetPasswordState ?? this.resetPasswordState;
    this.verifyResetCodeState = verifyResetCodeState ?? this.verifyResetCodeState;
  }

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
}
