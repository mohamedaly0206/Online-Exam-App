import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/edit_profile/domain/repo/edit_profile_repo_contract.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/models/user_model/user_entity.dart';

@injectable
class EditProfileUseCase {
  EditProfileUseCase(this.editProfileRepoContract);

  final EditProfileRepoContract editProfileRepoContract;

  Future<BaseResponse<UserEntity>> call({
    String? image,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    return await editProfileRepoContract.editProfile(
      image: image,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
