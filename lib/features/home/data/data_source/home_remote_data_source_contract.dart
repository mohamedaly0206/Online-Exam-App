import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/home/data/models/responses/subject_dto.dart';

abstract interface class HomeRemoteDataSourceContract {
  Future<BaseResponse<List<SubjectDto>>> getAllSubjects(String token);
}
