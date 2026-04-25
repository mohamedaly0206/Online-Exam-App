import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/subject_result_entity.dart';
import 'package:online_exam_app/features/exam_result/domain/repo/exam_result_repo_contract.dart';

@injectable
class GetExamsResultsHistoryUseCase {
  final ExamResultRepoContract repo;

  GetExamsResultsHistoryUseCase({required this.repo});

  Future<BaseResponse<List<SubjectResultEntity>>> call() =>
      repo.getExamsResultsHistory();
}
