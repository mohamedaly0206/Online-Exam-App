import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:online_exam_app/features/exam_result/data/models/exam_result_model.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class ExamResultLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _resultsKey = 'exam_results';

  ExamResultLocalDataSource();

  Future<List<ExamResultModel>> getResults() async {
    final String? userId = await _storage.read(key: AppStrings.userIdKey);
    final String key = userId != null && userId.isNotEmpty
        ? '${_resultsKey}_$userId'
        : _resultsKey;

    final String? resultsJson = await _storage.read(key: key);
    if (resultsJson != null) {
      final List<dynamic> decodedList = json.decode(resultsJson);
      return decodedList.map((e) => ExamResultModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<void> saveResult(ExamResultModel result) async {
    final String? userId = await _storage.read(key: AppStrings.userIdKey);
    final String key = userId != null && userId.isNotEmpty
        ? '${_resultsKey}_$userId'
        : _resultsKey;

    final List<ExamResultModel> currentResults = await getResults();
    currentResults.add(result);
    final String encodedList = json.encode(
      currentResults.map((e) => e.toJson()).toList(),
    );
    await _storage.write(key: key, value: encodedList);
  }
}
