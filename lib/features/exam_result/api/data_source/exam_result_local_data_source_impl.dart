import 'dart:developer';
import 'package:hive_ce/hive_ce.dart';
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
      print('!! 1');
      final box = await Hive.openBox('exam_results');
      print('!! 2');
      await box.add(ExamResultModelDTO.fromDomain(examResult, subjectName));
      print('examResult cached successfully: $examResult');
      return SuccessBaseResponse<bool>(data: true);
    } catch (e) {
      print('Error caching exam result: $e');
      return ErrorBaseResponse<bool>(errorMessage: e.toString());
    }
  }

  @override
  Future<BaseResponse<List<SubjectResultModelDTO>>>
  getExamsResultsHistory() async {
    try {
      log(
        '>>>>>>>>>>>>>>>>>getting exam results history from local data source',
      );
      log('>> 1');
      final box = await Hive.openBox('exam_results');
      log('>> 2');
      if (box.isEmpty) {
        log('>> 3');
        return SuccessBaseResponse<List<SubjectResultModelDTO>>(data: []);
      }
      log('>> 4');
      final allResults = box.values.cast<ExamResultModelDTO>().toList();
      log('>> 5');
      final Map<String, List<ExamResultModelDTO>> groupedResults = {};
      for (final result in allResults) {
        log('>> 6');
        if (groupedResults.containsKey(result.subjectName)) {
          log('>> 7');
          groupedResults[result.subjectName]!.add(result);
        } else {
          log('>> 8');
          groupedResults[result.subjectName] = [result];
        }
      }
      log('>> 9');
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
      log('>> 10');
      return ErrorBaseResponse<List<SubjectResultModelDTO>>(
        errorMessage: e.toString(),
      );
    }
  }
}
