import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/response/sign_up_response_model.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/intent/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view_model/state/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super((SignUpState()));
  final SignUpUseCase _signUpUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Future<void> handleSignUpIntent(SignUpIntent intent) async {
    if (intent is SubmitSignUp) {
      await _signUp(intent);
    }
  }

  Future<void> _signUp(SubmitSignUp intent) async {
    emit(
      state.copyWith(
        signUpStatePram: state.signUpState.copyWith(isLoadingParam: true),
      ),
    );
    final response = await _signUpUseCase.invoke(intent.requestModel);
    if (response is SuccessBaseResponse<SignUpResponseModel>) {
      await SecurityStorageModule.setSecuredString(
        AppStrings.tokenKey,
        response.data.token,
      );
      emit(
        state.copyWith(
          signUpStatePram: state.signUpState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );
      log(
        'signup success message: ${response.data.message} token: ${response.data.token}, username: ${response.data.user?.userName}, email: ${response.data.user?.email}, phoneNumber: ${response.data.user?.phone}, firstName: ${response.data.user?.firstName}, lastName: ${response.data.user?.lastName}',
      );
      _clearAllControllers();
    } else if (response is ErrorBaseResponse<SignUpResponseModel>) {
      emit(
        state.copyWith(
          signUpStatePram: state.signUpState.copyWith(
            isLoadingParam: false,
            errorMessageParam: response.errorMessage,
          ),
        ),
      );
      log(response.errorMessage);
    }
  }

  void _clearAllControllers() {
    userNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }
}
