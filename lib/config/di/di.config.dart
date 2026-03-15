// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/api/api_client/forget_password_api_client.dart'
    as _i478;
import '../../features/auth/forget_password/api/data_source/forget_password_local_data_source_impl.dart'
    as _i428;
import '../../features/auth/forget_password/api/data_source/forget_password_remote_data_source_impl.dart'
    as _i159;
import '../../features/auth/forget_password/data/data_source/forget_password_local_data_source_contract.dart'
    as _i187;
import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source_contract.dart'
    as _i246;
import '../../features/auth/forget_password/data/repo/forget_password_repo_impl.dart'
    as _i610;
import '../../features/auth/forget_password/domain/repo/forget_password_repo_contract.dart'
    as _i665;
import '../../features/auth/forget_password/domain/use_case/forget_password_use_case.dart'
    as _i222;
import '../../features/auth/forget_password/domain/use_case/reset_password_use_case.dart'
    as _i295;
import '../../features/auth/forget_password/domain/use_case/verify_reset_code_use_case.dart'
    as _i747;
import '../../features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart'
    as _i621;
import '../../features/auth/login/api/data_sources/login_remote_data_source_imp.dart'
    as _i182;
import '../../features/auth/login/api/login_api_client/login_api_client.dart'
    as _i251;
import '../../features/auth/login/data/data_sources/login_local_data_source_contract.dart'
    as _i724;
import '../../features/auth/login/data/data_sources/login_remote_data_source_contract.dart'
    as _i183;
import '../../features/auth/login/data/repo/login_repo_imp.dart' as _i21;
import '../../features/auth/login/domain/repo/login_repo_contract.dart'
    as _i844;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
import '../../features/auth/login/presentation/view_model/cubit/login_cubit.dart'
    as _i609;
import '../../features/auth/sign_up/api/data_sources/sign_up_remote_data_source_impl.dart'
    as _i478;
import '../../features/auth/sign_up/api/sign_up_api_client/sign_up_api_client.dart'
    as _i197;
import '../../features/auth/sign_up/data/data_sources/sign_up_remote_data_source_contract.dart'
    as _i274;
import '../../features/auth/sign_up/data/repo/sign_up_repo_impl.dart' as _i558;
import '../../features/auth/sign_up/domain/repo/sign_up_repo_contract.dart'
    as _i599;
import '../../features/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i1073;
import '../../features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart'
    as _i522;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i724.LoginLocalDataSourceContract>(
      () => _i724.LoginLocalDataSourceContract(),
    );
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i187.ForgetPasswordLocalDataSourceContract>(
      () => _i428.ForgetPasswordLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
      () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i251.LoginApiClient>(
      () => _i251.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i197.SignUpApiClient>(
      () => _i197.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i183.LoginRemoteDataSourceContract>(
      () => _i182.LoginRemoteDataSourceImp(gh<_i251.LoginApiClient>()),
    );
    gh.lazySingleton<_i246.ForgetPasswordRemoteDataSourceContract>(
      () => _i159.ForgetPasswordRemoteDataSourceImpl(
        forgetPasswordApiClient: gh<_i478.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i844.LoginRepoContract>(
      () => _i21.LoginRepoImp(
        gh<_i183.LoginRemoteDataSourceContract>(),
        gh<_i724.LoginLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(gh<_i844.LoginRepoContract>()),
    );
    gh.factory<_i274.SignUpRemoteDataSourceContract>(
      () => _i478.SignUpRemoteDataSourceImpl(gh<_i197.SignUpApiClient>()),
    );
    gh.factory<_i599.SignUpRepoContract>(
      () => _i558.SignUpRepoImpl(gh<_i274.SignUpRemoteDataSourceContract>()),
    );
    gh.factory<_i1073.SignUpUseCase>(
      () => _i1073.SignUpUseCase(gh<_i599.SignUpRepoContract>()),
    );
    gh.lazySingleton<_i665.ForgetPasswordRepoContract>(
      () => _i610.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSourceContract:
            gh<_i246.ForgetPasswordRemoteDataSourceContract>(),
        forgetPasswordLocalDataSourceContract:
            gh<_i187.ForgetPasswordLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i522.SignUpCubit>(
      () => _i522.SignUpCubit(gh<_i1073.SignUpUseCase>()),
    );
    gh.factory<_i222.ForgetPasswordUseCase>(
      () => _i222.ForgetPasswordUseCase(
        forgetPasswordRepoContract: gh<_i665.ForgetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i295.ResetPasswordUseCase>(
      () => _i295.ResetPasswordUseCase(
        forgetPasswordRepoContract: gh<_i665.ForgetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i747.VerifyResetCodeUseCase>(
      () => _i747.VerifyResetCodeUseCase(
        forgetPasswordRepoContract: gh<_i665.ForgetPasswordRepoContract>(),
      ),
    );
    gh.factory<_i609.LoginCubit>(
      () => _i609.LoginCubit(gh<_i50.LoginUseCase>()),
    );
    gh.factory<_i621.ForgetPasswordCubit>(
      () => _i621.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i222.ForgetPasswordUseCase>(),
        resetPasswordUseCase: gh<_i295.ResetPasswordUseCase>(),
        verifyResetCodeUseCase: gh<_i747.VerifyResetCodeUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
