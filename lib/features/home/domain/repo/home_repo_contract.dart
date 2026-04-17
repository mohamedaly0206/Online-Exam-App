import 'package:online_exam_app/config/base_response/base_response.dart';

import '../model/subject_entity.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();
}
