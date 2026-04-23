import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/edit_profile/data/models/edit_profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/api_endpoints.dart';
import '../../../../core/values/app_strings.dart';
import '../../data/models/edit_profile_request_body.dart';

part 'edit_profile_api_client.g.dart';

@injectable
@RestApi()
abstract class EditProfileApiClient {
  @factoryMethod
  factory EditProfileApiClient(Dio dio) = _EditProfileApiClient;

  @PUT(ApiEndpoints.editProfile)
  Future<EditProfileResponse> editProfile({
    @Header(AppStrings.token) required String token,
    @Body() required EditProfileRequestBody editProfileRequestBody,
  });
}
