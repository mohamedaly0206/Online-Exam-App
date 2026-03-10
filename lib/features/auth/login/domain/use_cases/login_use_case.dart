import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login/domain/models/user_model.dart';
import 'package:online_exam_app/features/auth/login/domain/repo/login_repo_contract.dart';
import '../../../../../config/base_response/base_response.dart';
@injectable
class LoginUseCase {
  LoginUseCase(this.loginRepo);
  final LoginRepoContract loginRepo;
  Future<BaseResponse<UserModel>> call({required String email,required String password})async{
    return loginRepo.login(email: email,password: password);
  }
}
