import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';

class SignUpState {
  final BaseState<SignUpResponseEntity> signUpState;

  SignUpState({BaseState<SignUpResponseEntity>? signUpState})
    : signUpState =
          signUpState ??
          BaseState<SignUpResponseEntity>(
            isLoading: false,
            data: null,
            errorMessage: null,
          );

  SignUpState copyWith({BaseState<SignUpResponseEntity>? signUpStateParam}) {
    return SignUpState(signUpState: signUpStateParam ?? signUpState);
  }
}