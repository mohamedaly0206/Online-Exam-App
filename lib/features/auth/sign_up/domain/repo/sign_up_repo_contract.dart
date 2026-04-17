import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/request/sign_up_request_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';

abstract interface class SignUpRepoContract {
  Future<BaseResponse<SignUpResponseEntity>> signUp(
    SignUpRequestEntity signUpRequestModel,
  );
}
