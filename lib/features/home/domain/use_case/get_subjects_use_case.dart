import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/home/domain/model/subject_model.dart';

import '../../../../config/base_response/base_response.dart';
import '../repo/home_repo_contract.dart';

@injectable
class GetSubjectsUseCase {
  GetSubjectsUseCase(this.homeRepo);

  final HomeRepoContract homeRepo;

  Future<BaseResponse<List<SubjectModel>>> call() async {
    return homeRepo.getAllSubjects();
  }
}
