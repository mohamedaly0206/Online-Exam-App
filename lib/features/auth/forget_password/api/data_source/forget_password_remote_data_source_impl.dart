import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/auth/forget_password/api/api_client/forget_password_api_client.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source_contract.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/forget_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/forget_password_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/requests/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/reset_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/verify_reset_code_dto.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSourceContract {
  ForgetPasswordRemoteDataSourceImpl({required this.forgetPasswordApiClient});

  final ForgetPasswordApiClient forgetPasswordApiClient;

  @override
  Future<BaseResponse<ForgetPasswordDTO>> forgetPassword({
    required String email,
  }) async {
    try {
      var response = await forgetPasswordApiClient.forgetPassword(
        ForgetPasswordRequest(email: email),
      );
      return SuccessBaseResponse<ForgetPasswordDTO>(data: response);
    } catch (e) {
      return ErrorBaseResponse<ForgetPasswordDTO>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }

  @override
  Future<BaseResponse<ResetPasswordDTO>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      var response = await forgetPasswordApiClient.resetPassword(
        ResetPasswordRequest(email: email, newPassword: newPassword),
      );
      return SuccessBaseResponse<ResetPasswordDTO>(data: response);
    } catch (e) {
      return ErrorBaseResponse(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeDTO>> verifyResetCode({
    required String resetCode,
  }) async {
    try {
      log("data source=> ");
      var response = await forgetPasswordApiClient.verifyResetCode(
        VerifyResetCodeRequest(code: resetCode),
      );
      log("data source=> response: ${response.toString()}");

      return SuccessBaseResponse<VerifyResetCodeDTO>(data: response);
    } catch (e) {
      log(e.toString());
      return ErrorBaseResponse<VerifyResetCodeDTO>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
