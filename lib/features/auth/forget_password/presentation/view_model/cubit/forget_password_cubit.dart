import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/utilities/functions/show_snack_bar.dart';
import '../../../domain/model/forget_password_model.dart';
import '../../../domain/model/reset_password_model.dart';
import '../../../domain/model/verify_reset_code_model.dart';
import '../../../domain/use_case/forget_password_use_case.dart';
import '../../../domain/use_case/reset_password_use_case.dart';
import '../../../domain/use_case/verify_reset_code_use_case.dart';
import '../../../presentation/view_model/state/forget_password_event.dart';
import 'package:online_exam_app/features/login_view.dart';

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
  int courantPageIndex = 0;

  void doEvent(ForgetPasswordEvent event) {
    switch (event) {
      case EnterEmailEvent():
        _enterEmail(event.context);
        break;
      case VerifyResetCodeEvent():
        _verifyResetCode(event.context, event.otp);
        break;
      case ResetPasswordEvent():
        _resetPassword(event.context);
        break;
      case BackToPriviesPageEvent():
        _priviesPage(event.context);
        break;
      case ResendOTPEvent():
        _resendOTP(event.context);
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

  void _priviesPage(BuildContext context) {
    courantPageIndex = 0;
    Navigator.of(context).pop();
  }

  void _nextPage(BuildContext context) {
    if (courantPageIndex < 2) {
      courantPageIndex++;
      pageController.animateToPage(
        courantPageIndex,
        duration: Duration(seconds: 2),
        curve: Curves.bounceIn,
      );
    } else {
      // todo: handel navigation after marge auth feature
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
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
        case SuccessBaseResponse<ForgetPasswordModel>():
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
        case ErrorBaseResponse<ForgetPasswordModel>():
          emit(
            state.copyWith(
              enterEmailStateParam: state.enterEmailState.copyWith(
                isLoadingParam: false,
                errorMessageParam: response.errorMessage,
              ),
            ),
          );
          enterEmailTextController.clear();
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
      switch (response) {
        case SuccessBaseResponse<VerifyResetCodeModel>():
          emit(
            state.copyWith(
              verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
                isLoadingParam: false,
                dataParam: true,
                errorMessageParam: null,
              ),
            ),
          );
          _nextPage(context);
          break;
        case ErrorBaseResponse<VerifyResetCodeModel>():
          emit(
            state.copyWith(
              verifyResetCodeStateParam: state.verifyResetCodeState.copyWith(
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
        case SuccessBaseResponse<ResetPasswordModel>():
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
        case ErrorBaseResponse<ResetPasswordModel>():
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
    final response = await forgetPasswordUseCase(enterEmailTextController.text);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordModel>():
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
      case ErrorBaseResponse<ForgetPasswordModel>():
        emit(
          state.copyWith(
            enterEmailStateParam: state.enterEmailState.copyWith(
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
