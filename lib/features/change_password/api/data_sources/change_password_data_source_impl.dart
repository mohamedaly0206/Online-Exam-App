import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/features/change_password/api/change_password_api_client/change_password_api_client.dart';
import 'package:online_exam_app/features/change_password/data/data_sources/change_password_remote_data_source_contract.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';

@Injectable(as: ChangePasswordRemoteDataSourceContract)
class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSourceContract {
  ChangePasswordApiClient changePasswordApiClient;

  ChangePasswordRemoteDataSourceImpl(this.changePasswordApiClient);
  @override
  Future<BaseResponse<ChangePasswordResponseDto>> changePassword(
     ChangePasswordRequestDto changePasswordRequestDto,
      token,
  ) async {
    try {
      final response = await changePasswordApiClient.changePassword(
        changePasswordRequestDto: changePasswordRequestDto,
        token: token,
      );
      return SuccessBaseResponse<ChangePasswordResponseDto>(data: response);
    } catch (e) {
      return ErrorBaseResponse<ChangePasswordResponseDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
