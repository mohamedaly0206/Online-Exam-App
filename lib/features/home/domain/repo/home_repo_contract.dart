import 'package:online_exam_app/config/base_response/base_response.dart';

import '../model/subject_model.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects();
}