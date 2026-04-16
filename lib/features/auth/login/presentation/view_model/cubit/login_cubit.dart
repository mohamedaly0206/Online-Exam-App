import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/models/user_entity.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../intent/login_intent.dart';
import '../state/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMeParam: value));
  }

  Future<void> handleLoginIntent(LoginIntent intent) async {
    if (intent is LoginSubmitIntent) {
      await _login(intent);
    }
  }

  Future<void> _login(LoginSubmitIntent intent) async {
    emit(
      state.copyWith(
        loginStateParam: state.loginState.copyWith(
          isLoadingParam: true,
          errorMessageParam: '',
          dataParam: null,
        ),
      ),
    );

    final response = await _loginUseCase.call(
      email: intent.email,
      password: intent.password,
      rememberMe: state.rememberMe,
    );

    if (response is SuccessBaseResponse<UserEntity>) {
      emit(
        state.copyWith(
          loginStateParam: state.loginState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
            errorMessageParam: '',
          ),
        ),
      );
    } else if (response is ErrorBaseResponse<UserEntity>) {
      emit(
        state.copyWith(
          loginStateParam: state.loginState.copyWith(
            isLoadingParam: false,
            errorMessageParam: response.errorMessage,
            dataParam: null,
          ),
        ),
      );
    }
  }
}
