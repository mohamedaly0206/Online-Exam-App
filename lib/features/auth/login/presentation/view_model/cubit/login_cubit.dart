import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/models/user_model.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../intent/login_intent.dart';
import '../state/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState());

  final LoginUseCase _loginUseCase;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  final formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> handleLoginIntent(LoginIntent intent) async {
    if (intent is LoginSubmitIntent) {
      await _login(intent);
    }
  }

  Future<void> _login(LoginSubmitIntent intent) async {
    emit(
      state.copyWith(
        loginStateParam: state.loginState.copyWith(isLoadingParam: true),
      ),
    );

    log(state.loginState.isLoading.toString());
    final response = await _loginUseCase.call(
      email: emailController.text,
      password: passwordController.text,
    );

    if (response is SuccessBaseResponse<UserModel>) {
      emit(
        state.copyWith(
          loginStateParam: state.loginState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );

    } else if (response is ErrorBaseResponse<UserModel>) {
      emit(
        state.copyWith(
          loginStateParam: state.loginState.copyWith(
            isLoadingParam: false,
            errorMessageParam: response.errorMessage,
          ),
        ),
      );
    }
  }
}
