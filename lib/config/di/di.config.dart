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
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i187.ForgetPasswordLocalDataSourceContract>(
      () => _i428.ForgetPasswordLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
      () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i246.ForgetPasswordRemoteDataSourceContract>(
      () => _i159.ForgetPasswordRemoteDataSourceImpl(
        forgetPasswordApiClient: gh<_i478.ForgetPasswordApiClient>(),
      ),
    );
    gh.lazySingleton<_i665.ForgetPasswordRepoContract>(
      () => _i610.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSourceContract:
            gh<_i246.ForgetPasswordRemoteDataSourceContract>(),
        forgetPasswordLocalDataSourceContract:
            gh<_i187.ForgetPasswordLocalDataSourceContract>(),
      ),
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
