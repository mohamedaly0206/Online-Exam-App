import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/models/user_model/user_entity.dart';
import '../../../../auth/login/domain/use_cases/get_logged_user_info_use_case.dart';
import '../intent/edit_profile_intent.dart';
import '../state/edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetLoggedUserInfoUseCase _getLoggedUserInfoUseCase;

  EditProfileCubit(this._editProfileUseCase, this._getLoggedUserInfoUseCase)
    : super(const EditProfileState());

  void processIntent(EditProfileIntent intent) {
    switch (intent) {
      case GetUserInfoIntent():
        _handleGetUserInfo();
      case SubmitEditProfileIntent():
        _handleSubmitEdit(intent);
    }
  }

  Future<void> _handleGetUserInfo() async {
    emit(
      state.copyWith(editProfileStateParam: const BaseState(isLoading: true)),
    );

    final response = await _getLoggedUserInfoUseCase.call();

    if (response is SuccessBaseResponse<UserEntity>) {
      emit(
        state.copyWith(
          editProfileStateParam: BaseState(
            isLoading: false,
            data: response.data,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          editProfileStateParam: BaseState(
            isLoading: false,
            errorMessage: (response as ErrorBaseResponse).errorMessage,
          ),
        ),
      );
    }
  }

  Future<void> _handleSubmitEdit(SubmitEditProfileIntent intent) async {
    emit(
      state.copyWith(
        editProfileStateParam: state.editProfileState.copyWith(
          isLoadingParam: true,
        ),
      ),
    );

    final response = await _editProfileUseCase.call(
      username: intent.username,
      firstName: intent.firstName,
      lastName: intent.lastName,
      email: intent.email,
      phone: intent.phone,
    );

    if (response is SuccessBaseResponse<UserEntity>) {
      emit(
        state.copyWith(
          editProfileStateParam: BaseState(
            isLoading: false,
            data: response.data,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          editProfileStateParam: state.editProfileState.copyWith(
            isLoadingParam: false,
            errorMessageParam: (response as ErrorBaseResponse).errorMessage,
          ),
        ),
      );
    }
  }
}
