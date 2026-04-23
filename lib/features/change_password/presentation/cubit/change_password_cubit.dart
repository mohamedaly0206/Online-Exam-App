import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_request_entity/change_password_request_entity.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_response_entity/change_password_response_entity.dart';
import 'package:online_exam_app/features/change_password/domain/use_cases/change_password_use_case.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordCubit(this.changePasswordUseCase)
    : super(ChangePasswordState());
  Future changePassword(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    log('changePassword loading...');
    emit(
      state.copyWith(
        changePasswordState: state.changePasswordState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    final response = await changePasswordUseCase.call(
      ChangePasswordRequestEntity(
        currentPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      ),
    );
    if (response is SuccessBaseResponse<ChangePasswordResponseEntity>) {
      log('changePassword success...');
      emit(
        state.copyWith(
          changePasswordState: state.changePasswordState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
            errorMessageParam: null,
          ),
        ),
      );
    } else {
      final error = response as ErrorBaseResponse<ChangePasswordResponseEntity>;
            log('ChangePassword Error: ${error.errorMessage}');

      emit(
        state.copyWith(
          changePasswordState: state.changePasswordState.copyWith(
            isLoadingParam: false,
            errorMessageParam: error.errorMessage,
          ),
        ),
      );
    }
  }
}
