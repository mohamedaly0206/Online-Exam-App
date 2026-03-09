import 'package:flutter_bloc/flutter_bloc.dart';
part 'sigin_up_state.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit() : super(SiginUpInitial());
}
