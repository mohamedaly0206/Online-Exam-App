import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/forget_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/forget_password_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/reset_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/verify_reset_code_dto.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(ApiEndpoints.forgetPassword)
  Future<ForgetPasswordDTO> forgetPassword(
    @Body() ForgetPasswordRequest data,
  );

  // there is an error here it don't know which account that have this resetCode(OTP)
  @POST(ApiEndpoints.verifyResetPassword)
  Future<VerifyResetCodeDTO> verifyResetCode(
    @Body() VerifyResetCodeRequest data,
  );

  @PUT(ApiEndpoints.resetPassword)
  Future<ResetPasswordDTO> resetPassword(
  @Body() ResetPasswordRequest data,
  );
}
