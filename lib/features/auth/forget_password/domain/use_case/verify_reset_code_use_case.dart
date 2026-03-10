import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/model/verify_reset_code_model.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class VerifyResetCodeUseCase {
  final ForgetPasswordRepoContract forgetPasswordRepoContract;

  VerifyResetCodeUseCase({required this.forgetPasswordRepoContract});

  Future<BaseResponse<VerifyResetCodeModel>> call(String resetCode) async {
    return await forgetPasswordRepoContract.verifyResetCode(resetCode);
  }
}
