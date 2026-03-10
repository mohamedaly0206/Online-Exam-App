import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/reset_password_model.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepoContract forgetPasswordRepoContract;

  ResetPasswordUseCase({required this.forgetPasswordRepoContract});

  Future<BaseResponse<ResetPasswordModel>> call(
    String email,
    String newPassword,
  ) async {
    return await forgetPasswordRepoContract.resetPassword(email, newPassword);
  }
}
