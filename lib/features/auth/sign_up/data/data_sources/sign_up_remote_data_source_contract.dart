import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/data/models/request/sign_up_request_dto.dart';
import 'package:online_exam_app/features/auth/sign_up/data/models/response/sign_up_response_dto.dart';

abstract class SignUpRemoteDataSourceContract {
  Future<BaseResponse<SignUpResponseDto>> signUp(
    SignUpRequestDto signUpRequestDto,
  );
}
