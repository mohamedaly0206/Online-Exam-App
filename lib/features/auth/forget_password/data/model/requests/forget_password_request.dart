import 'package:online_exam_app/core/values/api_param.dart';

class ForgetPasswordRequest{
  final String email;

  ForgetPasswordRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {
      ApiParam.email: email,
    };
  }
}
