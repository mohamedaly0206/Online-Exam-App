import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/request/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/models/response/sign_up_response_model.dart';

abstract interface class SignUpRepoContract {
  Future<BaseResponse<SignUpResponseModel>> signUp(
    SignUpRequestModel signUpRequestModel,
  );
}
