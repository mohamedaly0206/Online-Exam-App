import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_result/data/data_source/exam_result_local_data_source_contract.dart';
import 'package:online_exam_app/features/exam_result/data/model/exam_result_model_dto.dart';
import 'package:online_exam_app/features/exam_result/data/model/subject_result_model_dto.dart';
import 'package:online_exam_app/features/exam_result/domain/entity/exam_result_entity.dart';

@Injectable(as: ExamResultLocalDataSourceContract)
class ExamResultLocalDataSourceImpl
    implements ExamResultLocalDataSourceContract {
  @override
  Future<BaseResponse<bool>> cacheExamResult(
    ExamResultEntity examResult,
    String subjectName,
  ) async {
    try {
      final box = await Hive.openBox('exam_results');
      await box.add(ExamResultModelDTO.fromDomain(examResult, subjectName));
      return SuccessBaseResponse<bool>(data: true);
    } catch (e) {
      return ErrorBaseResponse<bool>(errorMessage: e.toString());
    }
  }

  @override
  Future<BaseResponse<List<SubjectResultModelDTO>>>
  getExamsResultsHistory() async {
    try {
      final box = await Hive.openBox('exam_results');
      if (box.isEmpty) {
        return SuccessBaseResponse<List<SubjectResultModelDTO>>(data: []);
      }
      final allResults = box.values.cast<ExamResultModelDTO>().toList();
      final Map<String, List<ExamResultModelDTO>> groupedResults = {};
      for (final result in allResults) {
        if (groupedResults.containsKey(result.subjectName)) {
          groupedResults[result.subjectName]!.add(result);
        } else {
          groupedResults[result.subjectName] = [result];
        }
      }

      return SuccessBaseResponse<List<SubjectResultModelDTO>>(
        data: groupedResults.entries
            .map(
              (entry) => SubjectResultModelDTO(
                subjectName: entry.key,
                examsResults: entry.value,
              ),
            )
            .toList(),
      );
    } catch (e) {
      return ErrorBaseResponse<List<SubjectResultModelDTO>>(
        errorMessage: e.toString(),
      );
    }
  }
}
