import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/models/user_model.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../intent/login_intent.dart';
import '../state/state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState());

  final LoginUseCase _loginUseCase;

  Future<void> handleLoginIntent(LoginIntent intent) async {
    if (intent is LoginSubmitIntent) {
      await _login(intent);
    }
  }

  Future<void> _login(LoginSubmitIntent intent) async {
    emit(state.copyWith(
      loginStateParam: state.loginState.copyWith(isLoadingParam: true),
    ));

    final response = await _loginUseCase.call(email: intent.email, password: intent.password);

    if (response is SuccessBaseResponse<UserModel>) {
      emit(state.copyWith(
        loginStateParam: state.loginState.copyWith(
          isLoadingParam: false,
          dataParam: response.data,
        ),
      ));
    } else if (response is ErrorBaseResponse<UserModel>) {
      emit(state.copyWith(
        loginStateParam: state.loginState.copyWith(
          isLoadingParam: false,
          errorMessageParam: response.errorMessage,
        ),
      ));
    }
  }
}