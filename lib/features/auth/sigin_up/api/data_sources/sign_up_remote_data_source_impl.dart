import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/sigin_up/api/sign_up_api_client/sign_up_api_client.dart';
import 'package:online_exam_app/features/auth/sigin_up/data/data_sources/sign_up_remote_data_source_contract.dart';
import 'package:online_exam_app/features/auth/sigin_up/data/models/request/sign_up_request_dto.dart';
import 'package:online_exam_app/features/auth/sigin_up/data/models/response/sign_up_response_dto.dart';

@Injectable(as: SignUpRemoteDataSourceContract)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSourceContract {
  final SignUpApiClient signUpApiClient;

  SignUpRemoteDataSourceImpl(this.signUpApiClient);
  @override
  Future<BaseResponse<SignUpResponseDto>> signUp(
    SignUpRequestDto signUpRequestDto,
  ) async {
    try {
      final response = await signUpApiClient.signUp(signUpRequestDto);
      return SuccessBaseResponse<SignUpResponseDto>(data: response);
    } catch (e) {
      return ErrorBaseResponse<SignUpResponseDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
