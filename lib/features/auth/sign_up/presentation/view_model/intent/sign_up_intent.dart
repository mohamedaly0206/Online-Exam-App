import 'package:online_exam_app/features/auth/sign_up/domain/entities/request/sign_up_request_entity.dart';

sealed class SignUpIntent {}

class SubmitSignUp extends SignUpIntent {
  final SignUpRequestEntity requestModel;

  SubmitSignUp({required this.requestModel});
}
