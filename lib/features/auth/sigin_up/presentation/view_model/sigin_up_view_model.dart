import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/models/request/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/models/response/sign_up_response_model.dart';
import 'package:online_exam_app/features/auth/sigin_up/domain/use_cases/sign_up_use_case.dart';
import 'package:online_exam_app/features/auth/sigin_up/presentation/view_model/sigin_up_state.dart';

@injectable
class SignUpViewModel extends Cubit<SiginUpState> {
  SignUpViewModel(this._signUpUseCase) : super((SiginUpState()));
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

  Future<void> signUp(SignUpRequestModel signUpRequestModel) async {
    emit(
      state.copyWith(
        signUpStatePram: state.signUpState.copyWith(isLoadingParam: true),
      ),
    );
    final response = await _signUpUseCase.invoke(signUpRequestModel);
    if (response is SuccessBaseResponse<SignUpResponseModel>) {
      await SecurityStorageModule.setSecuredString(
        'token',
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
}
