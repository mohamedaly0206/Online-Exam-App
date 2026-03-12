import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(
    DioException exception,
  ) {
    switch (exception.type) {
      case DioExceptionType
          .connectionTimeout:
        return ServerFailure(
          'Connection timeout with API server',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          'Send timeout with API server',
        );
      case DioExceptionType
          .receiveTimeout:
        return ServerFailure(
          'Receive timeout with API server',
        );
      case DioExceptionType
          .badCertificate:
        return ServerFailure(
          'Bad certificate with API server',
        );
      case DioExceptionType
          .badResponse: //**********
        return ServerFailure.fromResponse(
          exception
              .response!
              .statusCode!,
          exception.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          'Request to API server was cancelled',
        );
      case DioExceptionType
          .connectionError:
        return ServerFailure(
          'There is Connection Error',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          'No Internet Connection',
        );
    }
  }
  factory ServerFailure.fromResponse(
    int statusCode,
    dynamic response,
  ) {

    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403) {
      final String errorMessageRes = response['message'] ?? 'Opps, there was an error';
      if (errorMessageRes.contains('password')) {
        return ServerFailure(
          'Password must be at least 8 characters long, include uppercase, lowercase, a number, and a special character.',
        );
      }
      else if (errorMessageRes.contains('email')) {
        return ServerFailure('The email address provided is invalid.');
      }


      return ServerFailure(
        errorMessageRes,
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        'Opps there was an error, please try again',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        'Internal server error, please try again later',
      );
    } else {
      return ServerFailure(
        'Opps there was an error, please try again',
      );
    }
  }
}
