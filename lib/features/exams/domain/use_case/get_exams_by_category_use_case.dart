import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../model/exams_model.dart';
import '../repo/exams_repo_contract.dart';

@injectable
class GetExamsByCategoryUseCase {
  GetExamsByCategoryUseCase({required this.examsRepoContract});
  final ExamsRepoContract examsRepoContract;

  Future<BaseResponse<List<ExamModel>>> call({
    required String token,
    required String? subjectId,
  }) async=> examsRepoContract.getExams(token: token, subjectId: subjectId);
}
