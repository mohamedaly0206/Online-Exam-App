import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/forget_password_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/verify_reset_code_entity.dart';

abstract interface class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(String email);
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    String email,
    String newPassword,
  );
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode(String resetCode);
}
