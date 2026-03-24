import 'package:online_exam_app/features/auth/sign_up/domain/models/request/sign_up_request_model.dart';

abstract class SignUpIntent {}

class SubmitSignUp extends SignUpIntent {
  final SignUpRequestModel requestModel;

  SubmitSignUp({required this.requestModel});
}
