import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/forget_password_model.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/reset_password_model.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/verify_reset_code_model.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordModel>> forgetPassword(String email);
  Future<BaseResponse<ResetPasswordModel>> resetPassword(
    String email,
    String newPassword,
  );
  Future<BaseResponse<VerifyResetCodeModel>> verifyResetCode(String resetCode);
}
