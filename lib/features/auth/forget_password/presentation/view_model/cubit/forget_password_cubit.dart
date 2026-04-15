import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import '../../../domain/entity/forget_password_entity.dart';
import '../../../domain/entity/reset_password_entity.dart';
import '../../../domain/entity/verify_reset_code_entity.dart';
import '../../../domain/use_case/forget_password_use_case.dart';
import '../../../domain/use_case/reset_password_use_case.dart';
import '../../../domain/use_case/verify_reset_code_use_case.dart';
import '../intent/forget_password_intent.dart';
import '../state/forget_password_state.dart';

@singleton
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
  // formKeys
  final GlobalKey<FormState> enterEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyResetCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  // text form field controllers
  final TextEditingController enterEmailTextController =
      TextEditingController();
  final TextEditingController resetCodeTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  // page controller
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case EnterEmailIntent():
        _enterEmail(intent.context);
        break;
      case VerifyResetCodeIntent():
        _verifyResetCode(intent.context, intent.otp);
        break;
      case ResetPasswordIntent():
        _resetPassword(intent.context);
        break;
      case BackToPriviesPageIntent():
        _previousPage(intent.context);
        break;
      case ResendOTPIntent():
        _resendOTP(intent.context);
        break;
    }
  }

  @override
  Future<void> close() {
    enterEmailTextController.dispose();
    resetCodeTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    pageController.dispose();
    return super.close();
  }

  void _previousPage(BuildContext context) {
    currentPageIndex = 0;
    GoRouter.of(context).pop();
  }

  void _nextPage(BuildContext context) {
    if (currentPageIndex < 2) {
      currentPageIndex++;
      pageController.animateToPage(
        currentPageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOutCubicEmphasized,
      );
    } else {
      GoRouter.of(context).pop();
    }
  }

  Future<void> _enterEmail(BuildContext context) async {
    if (enterEmailFormKey.currentState!.validate()) {
      emit(
        state.copyWith(
          enterEmailStateParam: state.enterEmailState.copyWith(
            isLoadingParam: true,
          ),
        ),
      );
      final response = await forgetPasswordUseCase(
        enterEmailTextController.text,
      );
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
          _nextPage(context);
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
          // enterEmailTextController.clear();
          showSnackBar(
            context: context,
            message: response.errorMessage,
            color: Theme.of(context).colorScheme.error,
          );
          break;
      }
    }
  }

  Future<void> _verifyResetCode(BuildContext context, String otp) async {
    if (verifyResetCodeFormKey.currentState!.validate()) {
      emit(
        state.copyWith(
          verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
            isLoadingParam: true,
          ),
        ),
      );
      final response = await verifyResetCodeUseCase(otp);
      log(response.toString());
      log(otp);
      switch (response) {
        case SuccessBaseResponse<VerifyResetCodeEntity>():
          emit(
            state.copyWith(
              verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
                isLoadingParam: false,
                dataParam: true,
                errorMessageParam: null,
              ),
            ),
          );
          log('go next');
          _nextPage(context);
          log('go next done!');
          break;
        case ErrorBaseResponse<VerifyResetCodeEntity>():
          log('error');
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
  }

  Future<void> _resetPassword(BuildContext context) async {
    if (resetPasswordFormKey.currentState!.validate()) {
      emit(
        state.copyWith(
          resetPasswordStateParam: state.resetPasswordState.copyWith(
            isLoadingParam: true,
          ),
        ),
      );
      final response = await resetPasswordUseCase(
        enterEmailTextController.text,
        passwordTextController.text,
      );
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
          _nextPage(context);
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
          showSnackBar(
            context: context,
            message: response.errorMessage,
            color: Theme.of(context).colorScheme.error,
          );
          break;
      }
    }
  }

  Future<void> _resendOTP(BuildContext context) async {
    emit(
      state.copyWith(
        resendOTPStateParam: state.resendOTPState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    log(enterEmailTextController.text);
    final response = await forgetPasswordUseCase(enterEmailTextController.text);
    log(response.toString());
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
        showSnackBar(
          context: context,
          message: response.errorMessage,
          color: Theme.of(context).colorScheme.secondary,
        );
        break;
    }
  }
}
