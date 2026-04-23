import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/security_storage/security_storage.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/change_password/data/data_sources/change_password_remote_data_source_contract.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_request_entity/change_password_request_entity.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_response_entity/change_password_response_entity.dart';
import 'package:online_exam_app/features/change_password/domain/repo/change_password_repo_contract.dart';

@Injectable(as: ChangePasswordRepoContract)
class ChangePasswordRepoImpl implements ChangePasswordRepoContract {
  final ChangePasswordRemoteDataSourceContract _dataSource;
  ChangePasswordRepoImpl(this._dataSource);
  @override
  Future<BaseResponse<ChangePasswordResponseEntity>> changePassword(
   ChangePasswordRequestEntity changePasswordRequestEntity,

     
  )async {
final token = await getIt<SecurityStorage>()
    .getSecuredString(AppStrings.token);

if (token.isEmpty) {
  log("❌ Token is empty");
  return ErrorBaseResponse(errorMessage: "Unauthorized");
}
    final response =await  _dataSource.changePassword(
      ChangePasswordRequestDto.fromDomain(changePasswordRequestEntity),
      token
    );

    switch(response) {
      case SuccessBaseResponse<ChangePasswordResponseDto>():
        return SuccessBaseResponse(data: response.data.toDomain());
      case ErrorBaseResponse<ChangePasswordResponseDto>():
      
        return ErrorBaseResponse(errorMessage:  response.errorMessage);
    }
    
  }
}
