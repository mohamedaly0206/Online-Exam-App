import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/intent/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/state/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super((SignUpState()));
  final SignUpUseCase _signUpUseCase;

  Future<void> handleSignUpIntent(SignUpIntent intent) async {
    if (intent is SubmitSignUp) {
      await _signUp(intent);
    }
  }

  Future<void> _signUp(SubmitSignUp intent) async {
    emit(
      state.copyWith(
        signUpStateParam: state.signUpState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );
    final response = await _signUpUseCase.invoke(intent.requestModel);
    if (response is SuccessBaseResponse<SignUpResponseModel>) {
      await SecurityStorageModule.setSecuredString(
        AppStrings.token,
        response.data.token,
      );
      emit(
        state.copyWith(
          signUpStateParam: state.signUpState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );
    } else {
      final error = response as ErrorBaseResponse<SignUpResponseEntity>;
      emit(
        state.copyWith(
          signUpStateParam: state.signUpState.copyWith(
            isLoadingParam: false,
            errorMessageParam: error.errorMessage,
          ),
        ),
      );
    }
  }
}
