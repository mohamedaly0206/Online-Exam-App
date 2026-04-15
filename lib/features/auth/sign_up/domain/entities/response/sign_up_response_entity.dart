import 'package:online_exam_app/config/models/user_model.dart';

class SignUpResponseEntity {
  final String? message;
  final String? token;
  final UserModel? user;

  SignUpResponseEntity({required this.message, required this.token, this.user});
}
