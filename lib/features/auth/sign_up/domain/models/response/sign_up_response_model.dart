import 'package:online_exam_app/config/models/user_model.dart';

class SignUpResponseModel {
  final String? message;
  final String? token;
  final UserModel? user;

  SignUpResponseModel({required this.message, required this.token, this.user});
}
