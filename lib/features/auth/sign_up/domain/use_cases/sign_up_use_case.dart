import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/request/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/response/sign_up_response_model.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/repo/sign_up_repo_contract.dart';

@injectable
class SignUpUseCase {
  final SignUpRepoContract _signUpRepoContract;
  SignUpUseCase(this._signUpRepoContract);

  Future<BaseResponse<SignUpResponseModel>> call(
    SignUpRequestModel signUpRequestModel,
  ) => _signUpRepoContract.signUp(signUpRequestModel);
}
