import 'package:equatable/equatable.dart';

import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';
import '../../../domain/entities/logout_entity.dart';

class EditProfileState extends Equatable {
  final BaseState<UserEntity> editProfileState;
  final BaseState<LogoutEntity> logoutState;

  const EditProfileState({
    this.editProfileState = const BaseState<UserEntity>(),
    this.logoutState = const BaseState<LogoutEntity>(),
  });

  EditProfileState copyWith({
    BaseState<UserEntity>? editProfileStateParam,
    BaseState<LogoutEntity>? logoutStateParam,
  }) {
    return EditProfileState(
      editProfileState: editProfileStateParam ?? editProfileState,
      logoutState: logoutStateParam ?? logoutState,
    );
  }

  @override
  List<Object?> get props => [editProfileState, logoutState];
}
