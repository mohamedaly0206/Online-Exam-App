import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_local_data_source_contract.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source_contract.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/forget_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/reset_password_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/data/model/verify_reset_code_dto.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/forget_password_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entity/verify_reset_code_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {
  final ForgetPasswordRemoteDataSourceContract
  forgetPasswordRemoteDataSourceContract;
  final ForgetPasswordLocalDataSourceContract
  forgetPasswordLocalDataSourceContract;

  ForgetPasswordRepoImpl({
    required this.forgetPasswordRemoteDataSourceContract,
    required this.forgetPasswordLocalDataSourceContract,
  });

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(
    String email,
  ) async {
    var response = await forgetPasswordRemoteDataSourceContract.forgetPassword(
      email: email,
    );
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordDTO>():
        return SuccessBaseResponse<ForgetPasswordEntity>(
          data: response.data.toDomain(),
        );
      case ErrorBaseResponse<ForgetPasswordDTO>():
        return ErrorBaseResponse<ForgetPasswordEntity>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    String email,
    String newPassword,
  ) async {
    var response = await forgetPasswordRemoteDataSourceContract.resetPassword(
      email: email,
      newPassword: newPassword,
    );
    switch (response) {
      case SuccessBaseResponse<ResetPasswordDTO>():
        return SuccessBaseResponse<ResetPasswordEntity>(
          data: response.data.toDomain(),
        );
      case ErrorBaseResponse<ResetPasswordDTO>():
        return ErrorBaseResponse<ResetPasswordEntity>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode(
    String resetCode,
  ) async {
    var response = await forgetPasswordRemoteDataSourceContract.verifyResetCode(
      resetCode: resetCode,
    );
    switch (response) {
      case SuccessBaseResponse<VerifyResetCodeDTO>():
        return SuccessBaseResponse<VerifyResetCodeEntity>(
          data: response.data.toDomain(),
        );
      case ErrorBaseResponse<VerifyResetCodeDTO>():
        return ErrorBaseResponse(errorMessage: response.errorMessage);
    }
  }
}
