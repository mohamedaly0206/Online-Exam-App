import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/models/user_model/user_model.dart';

import '../../../../../config/base_response/base_response.dart';
import '../repo/login_repo_contract.dart';

@Injectable()
class GetLoggedUserInfoUseCase {
  GetLoggedUserInfoUseCase(this.loginRepo);

  final LoginRepoContract loginRepo;

  Future<BaseResponse<UserModel>> call() async {
    return await loginRepo.getLoggedUserInfo();
  }
}