import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/response/sign_up_response_model.dart';

class SignUpState {
 final  BaseState<SignUpResponseModel> signUpState ;

  SignUpState({BaseState<SignUpResponseModel>? signUpState}) 
   :signUpState=signUpState ?? BaseState<SignUpResponseModel>(
      isLoading: false,
      data: null,
      errorMessage: null,
   );
  
  SignUpState copyWith({BaseState<SignUpResponseModel>? signUpStateParam}) {
    return SignUpState(signUpState: signUpStateParam ?? signUpState);
  }
}
