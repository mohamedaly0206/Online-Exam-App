import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:online_exam_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';

abstract interface class ChangePasswordRemoteDataSourceContract {
  Future<BaseResponse<ChangePasswordResponseDto>> changePassword(
     ChangePasswordRequestDto changePasswordRequestDto,
     String token,
  );
}
