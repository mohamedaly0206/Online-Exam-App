import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';

class SignUpState extends Equatable {
  final BaseState<SignUpResponseEntity> signUpState;

  const SignUpState({ this.signUpState = const BaseState()}) ;

  SignUpState copyWith({BaseState<SignUpResponseEntity>? signUpStateParam}) {
    return SignUpState(signUpState: signUpStateParam ?? signUpState);
  }

  @override
  List<Object?> get props => [signUpState];
}
