import 'package:equatable/equatable.dart';
import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';

class EditProfileState extends Equatable {
  final BaseState<UserEntity> editProfileState;

  const EditProfileState({
    this.editProfileState = const BaseState<UserEntity>(),
  });

  EditProfileState copyWith({BaseState<UserEntity>? editProfileStateParam}) {
    return EditProfileState(
      editProfileState: editProfileStateParam ?? editProfileState,
    );
  }

  @override
  List<Object?> get props => [editProfileState];
}
