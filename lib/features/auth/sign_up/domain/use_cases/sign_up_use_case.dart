import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/request/sign_up_request_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/repo/sign_up_repo_contract.dart';

@injectable
class SignUpUseCase {
  final SignUpRepoContract _signUpRepoContract;
  SignUpUseCase(this._signUpRepoContract);

  Future<BaseResponse<SignUpResponseEntity>> call(
    SignUpRequestEntity signUpRequestModel,
  ) => _signUpRepoContract.signUp(signUpRequestModel);
}
