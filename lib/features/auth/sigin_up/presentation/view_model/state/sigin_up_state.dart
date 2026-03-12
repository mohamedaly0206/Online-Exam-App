import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/models/response/sign_up_response_model.dart';

class SignUpState {
  BaseState<SignUpResponseModel> signUpState = BaseState<SignUpResponseModel>(
    isLoading: true,
  );

  SignUpState({BaseState<SignUpResponseModel>? signUpState}) {
    this.signUpState = signUpState ?? this.signUpState;
  }
  SignUpState copyWith({BaseState<SignUpResponseModel>? signUpStatePram}) {
    return SignUpState(signUpState: signUpStatePram ?? signUpState);
  }
}
