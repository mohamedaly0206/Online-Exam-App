import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/security_storage/security_storage_module.dart';
import '../../../domain/entity/forget_password_entity.dart';
import '../../../domain/entity/reset_password_entity.dart';
import '../../../domain/entity/verify_reset_code_entity.dart';
import '../../../domain/use_case/forget_password_use_case.dart';
import '../../../domain/use_case/reset_password_use_case.dart';
import '../../../domain/use_case/verify_reset_code_use_case.dart';
import '../intent/forget_password_intent.dart';
import '../state/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.verifyResetCodeUseCase,
  }) : super(ForgetPasswordState());

  // use case injection
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case EnterResetEmailIntent():
        _sendResetEmail(intent.email);
        break;
      case VerifyResetCodeIntent():
        _verifyResetCode(intent.otp);
        break;
      case ResetPasswordIntent():
        _resetPassword(newPassword: intent.newPassword);
        break;
      case ResendOTPIntent():
        _resendOTP();
        break;
    }
  }

  void _saveEmailLocally(String email) {
    SecurityStorageModule.setSecuredString('email', email);
  }

  Future<String> _getEmailFromLocal() async {
    return await SecurityStorageModule.getSecuredString('email');
  }

  Future<void> _sendResetEmail(String email) async {
    emit(
      state.copyWith(
        enterEmailStateParam: state.enterEmailState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    final response = await forgetPasswordUseCase(email);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            enterEmailStateParam: state.enterEmailState.copyWith(
              isLoadingParam: false,
              dataParam: true,
            ),
          ),
        );
        _saveEmailLocally(email);
        break;
      case ErrorBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            enterEmailStateParam: state.enterEmailState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _verifyResetCode(String otp) async {
    emit(
      state.copyWith(
        verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    final response = await verifyResetCodeUseCase(otp);
    switch (response) {
      case SuccessBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
              isLoadingParam: false,
              dataParam: true,
              errorMessageParam: '',
            ),
            resendOTPStateParam: state.resendOTPState.copyWith(
              errorMessageParam: '',
            ),
          ),
        );
        break;
      case ErrorBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _resetPassword({required String newPassword}) async {
    emit(
      state.copyWith(
        resetPasswordStateParam: state.resetPasswordState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    final email = await _getEmailFromLocal();
    final response = await resetPasswordUseCase(email, newPassword);
    switch (response) {
      case SuccessBaseResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPasswordStateParam: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              dataParam: true,
              errorMessageParam: null,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPasswordStateParam: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _resendOTP() async {
    emit(
      state.copyWith(
        resendOTPStateParam: state.resendOTPState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    final email = await _getEmailFromLocal();
    final response = await forgetPasswordUseCase(email);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendOTPStateParam: state.resendOTPState.copyWith(
              isLoadingParam: false,
              dataParam: true,
              errorMessageParam: null,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendOTPStateParam: state.resendOTPState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }
}
