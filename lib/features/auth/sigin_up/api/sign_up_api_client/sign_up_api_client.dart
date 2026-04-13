import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/sigin_up/data/models/request/sign_up_request_dto.dart';
import 'package:online_exam_app/features/auth/sigin_up/data/models/response/sign_up_response_dto.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_client.g.dart';

@injectable
@RestApi()
abstract class SignUpApiClient {
  @factoryMethod
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;
  @POST(ApiEndpoints.signUp)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto signUpRequestDto);
}
