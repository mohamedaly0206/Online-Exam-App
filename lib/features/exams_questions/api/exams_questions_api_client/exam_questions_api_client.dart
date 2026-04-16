import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:online_exam_app/core/values/api_param.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_questions_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_questions_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ExamQuetsionsApiClient {
  @factoryMethod
  factory ExamQuetsionsApiClient(Dio dio) = _ExamQuetsionsApiClient;
  @GET(ApiEndpoints.getExamQuestions)
  Future<ExamQuestionsDto> getExamsQuestions({
    @Query(ApiParam.getAllExamQuestions) String? examId,
    @Header(AppStrings.token) String? token,
  });
}
