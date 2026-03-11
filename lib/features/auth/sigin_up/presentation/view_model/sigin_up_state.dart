import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/models/response/sign_up_response_model.dart';

class SiginUpState {
  BaseState<SignUpResponseModel> signUpState = BaseState<SignUpResponseModel>(
    isLoading: true,
  );
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  SiginUpState({
    BaseState<SignUpResponseModel>? signUpState,
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
  }) {
    this.signUpState = signUpState ?? this.signUpState;
  }
  SiginUpState copyWith({
    BaseState<SignUpResponseModel>? signUpStatePram,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return SiginUpState(
      signUpState: signUpStatePram ?? signUpState,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}
