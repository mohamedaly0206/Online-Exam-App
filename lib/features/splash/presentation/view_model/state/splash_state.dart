import 'package:equatable/equatable.dart';
import '../../../../../../config/base_state/base_state.dart';
import '../../../../../../config/models/user_model/user_entity.dart';

class SplashState extends Equatable {
  final BaseState<UserEntity> splashState;

  const SplashState({this.splashState = const BaseState<UserEntity>()});

  SplashState copyWith({BaseState<UserEntity>? splashStateParam}) {
    return SplashState(splashState: splashStateParam ?? splashState);
  }

  @override
  List<Object?> get props => [splashState];
}
