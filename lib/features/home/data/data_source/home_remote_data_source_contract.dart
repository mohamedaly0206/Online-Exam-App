import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/home/data/models/subjects_response.dart';

abstract class HomeRemoteDataSourceContract {
  Future<BaseResponse<SubjectsResponse>> getAllSubjects();
}