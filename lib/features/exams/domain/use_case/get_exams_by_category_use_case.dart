import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/exams_entity.dart';
import '../repo/exams_repo_contract.dart';

@injectable
class GetExamsByCategoryUseCase {
  GetExamsByCategoryUseCase({required this.examsRepoContract});
  final ExamsRepoContract examsRepoContract;

  Future<BaseResponse<List<ExamEntity>>> call({
    required String subjectId,
  }) async => examsRepoContract.getExams(subjectId: subjectId);
}
