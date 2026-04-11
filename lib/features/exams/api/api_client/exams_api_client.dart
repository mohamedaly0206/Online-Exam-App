import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:online_exam_app/core/values/api_param.dart';
import 'package:online_exam_app/features/exams/data/model/get_exams_response.dart';
import 'package:retrofit/retrofit.dart';

part 'exams_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio) = _ExamsApiClient;

  @GET(ApiEndpoints.getAllExams)
  Future<GetExamsResponse> getExams(
    @Header(ApiParam.token) String token,
    @Query(ApiParam.getSubjectExams) String? subjectId,
  );
}
