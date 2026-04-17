import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/home/data/models/subjects_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/api_endpoints.dart';

part 'get_all_subjects_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApiEndpoints.getAllSubjects)
  Future<SubjectsResponse> getAllSubjects({
    @Header(AppStrings.token) required String token,
  });
}
