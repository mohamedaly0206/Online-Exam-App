import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/api_endpoints.dart';
import 'package:online_exam_app/features/exams_questions/data/models/exam_questions_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_questions_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamQuetsionsApiClient {
  @factoryMethod
  factory ExamQuetsionsApiClient(Dio dio) = _ExamQuetsionsApiClient;
  @GET(ApiEndpoints.getExamQuestions)
  Future<ExamQuestionsDto> getExamsQuestions({
    @Query("exam") String? examId,
    @Header("token") String? token,
  });
}
