import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'change_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ChangePasswordApiClient {
  @factoryMethod
  factory ChangePasswordApiClient(Dio dio) = _ChangePasswordApiClient;
  @PATCH(ApiEndpoints.changePassword)
  Future<ChangePasswordResponseDto> changePassword({
    @Body() required ChangePasswordRequestDto changePasswordRequestDto,
    @Header(AppStrings.token) required String token,
  });
}
