import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/values/constants.dart' as AppEndPoints;

@module
abstract class DioModule{
  @singleton
  Dio get dio => Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseUrl, //AppEndPoints.baseUrl
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )
  );
}