import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/api_endpoints.dart';

part 'login_api_client.g.dart';

@injectable
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(ApiEndpoints.login)
  Future<LoginResponse> login({@Body() required Map<String, dynamic> body});

  @GET(ApiEndpoints.getLoggedUserInfo)
  Future<LoginResponse> getLoggedUserInfo({
    @Header("token") required String token,
  });
}
