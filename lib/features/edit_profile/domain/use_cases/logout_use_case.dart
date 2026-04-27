import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/edit_profile/domain/entities/logout_entity.dart';
import 'package:online_exam_app/features/edit_profile/domain/repo/edit_profile_repo_contract.dart';

import '../../../../../config/base_response/base_response.dart';

@injectable
class LogoutUseCase {
  LogoutUseCase(this.editProfileRepoContract);

  final EditProfileRepoContract editProfileRepoContract;

  Future<BaseResponse<LogoutEntity>> call() async {
    return await editProfileRepoContract.logout();
  }
}
