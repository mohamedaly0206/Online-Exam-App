import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/forget_password_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract forgetPasswordRepoContract;

  ForgetPasswordUseCase({required this.forgetPasswordRepoContract});

  Future<BaseResponse<ForgetPasswordEntity>> call(String email) async {
    return await forgetPasswordRepoContract.forgetPassword(email);
  }
}
