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

import '../../features/auth/sigin_up/api/data_sources/sign_up_remote_data_source_impl.dart'
    as _i478;
import '../../features/auth/sigin_up/api/sign_up_api_client/sign_up_api_client.dart'
    as _i197;
import '../../features/auth/sigin_up/data/data_sources/sign_up_remote_data_source_contract.dart'
    as _i274;
import '../../features/auth/sigin_up/data/repo/sign_up_repo_impl.dart' as _i558;
import '../../features/auth/sigin_up/domain/repo/sign_up_repo_contract.dart'
    as _i599;
import '../../features/auth/sigin_up/domain/use_cases/sign_up_use_case.dart'
    as _i1073;
import '../../features/auth/sigin_up/presentation/view_model/sigin_up_view_model.dart'
    as _i458;
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
    gh.factory<_i197.SignUpApiClient>(
      () => _i197.SignUpApiClient(gh<_i361.Dio>()),
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
    gh.factory<_i458.SignUpViewModel>(
      () => _i458.SignUpViewModel(gh<_i1073.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
