import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_request_entity/change_password_request_entity.dart';
import 'package:online_exam_app/features/change_password/domain/entities/change_password_response_entity/change_password_response_entity.dart';

abstract interface class ChangePasswordRepoContract {
  Future<BaseResponse<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity changePasswordRequestEntity,
  );
}
