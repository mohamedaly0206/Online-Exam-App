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
    gh.factory<_i251.LoginApiClient>(
      () => _i251.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i183.LoginRemoteDataSourceContract>(
      () => _i182.LoginRemoteDataSourceImp(gh<_i251.LoginApiClient>()),
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
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
