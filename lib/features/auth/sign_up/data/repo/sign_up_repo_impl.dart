import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/sign_up/data/data_sources/sign_up_remote_data_source_contract.dart';
import 'package:online_exam_app/features/auth/sign_up/data/models/request/sign_up_request_dto.dart';
import 'package:online_exam_app/features/auth/sign_up/data/models/response/sign_up_response_dto.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/request/sign_up_request_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';
import 'package:online_exam_app/features/auth/sign_up/domain/repo/sign_up_repo_contract.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpRemoteDataSourceContract _signUpRemoteDataSourceContract;

  SignUpRepoImpl(this._signUpRemoteDataSourceContract);
  @override
  Future<BaseResponse<SignUpResponseEntity>> signUp(
    SignUpRequestEntity signUpRequestModel,
  ) async {
    final requestDto = SignUpRequestDto.fromDomain(signUpRequestModel);
    final response = await _signUpRemoteDataSourceContract.signUp(requestDto);

    switch (response) {
      case SuccessBaseResponse<SignUpResponseDto>():
        return SuccessBaseResponse(data: response.data.toDomain());
      case ErrorBaseResponse<SignUpResponseDto>():
        return ErrorBaseResponse(errorMessage: response.errorMessage);
    }
  }
}
