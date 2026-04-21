import 'package:online_exam_app/config/models/user_model/user_entity.dart';

class SignUpResponseModel {
  final String message;
  final String token;
  final UserEntity? user;

  SignUpResponseModel({required this.message, required this.token, this.user});
}
