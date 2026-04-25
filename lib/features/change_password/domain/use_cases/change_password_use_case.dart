import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_request_entity/change_password_request_entity.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_response_entity/change_password_response_entity.dart';
import 'package:online_exam_app/features/change_password/domain/repo/change_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepoContract changePasswordRepoContract;
  ChangePasswordUseCase(this.changePasswordRepoContract);
  Future<BaseResponse<ChangePasswordResponseEntity>> call(
    ChangePasswordRequestEntity changePasswordRequestEntity,
  ) async {
    return await changePasswordRepoContract.changePassword(
      changePasswordRequestEntity,
    );
  }
}
