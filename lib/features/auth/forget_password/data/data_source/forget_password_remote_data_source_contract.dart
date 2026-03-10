import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/forget_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/reset_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/verify_reset_code_dto.dart';

abstract class ForgetPasswordRemoteDataSourceContract {

  Future<BaseResponse<ForgetPasswordDTO>> forgetPassword({
    required String email,
  });

  Future<BaseResponse<VerifyResetCodeDTO>> verifyResetCode({
    required String resetCode,
  });

  Future<BaseResponse<ResetPasswordDTO>> resetPassword({
    required String email,
    required String newPassword,
  });
}
