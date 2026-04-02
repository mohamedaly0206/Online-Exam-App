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
import '../../features/auth/login/api/data_sources/login_local_data_source_imp.dart'
    as _i716;
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
import '../../features/auth/login/domain/use_cases/check_user_logged_in_use_case.dart'
    as _i996;
import '../../features/auth/login/domain/use_cases/get_logged_user_info_use_case.dart'
    as _i171;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
import '../../features/auth/login/presentation/view_model/cubit/login_cubit.dart'
    as _i609;
import '../../features/auth/sign_up/api/data_sources/sign_up_remote_data_source_impl.dart'
    as _i1052;
import '../../features/auth/sign_up/api/sign_up_api_client/sign_up_api_client.dart'
    as _i858;
import '../../features/auth/sign_up/data/data_sources/sign_up_remote_data_source_contract.dart'
    as _i539;
import '../../features/auth/sign_up/data/repo/sign_up_repo_impl.dart' as _i150;
import '../../features/auth/sign_up/domain/repo/sign_up_repo_contract.dart'
    as _i366;
import '../../features/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i45;
import '../../features/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart'
    as _i667;
import '../../features/exams/api/api_client/exams_api_client.dart' as _i188;
import '../../features/exams/api/data_source/exams_local_data_source_impl.dart'
    as _i896;
import '../../features/exams/api/data_source/exams_remote_data_source_impl.dart'
    as _i895;
import '../../features/exams/data/data_source/exams_local_data_source_contract.dart'
    as _i148;
import '../../features/exams/data/data_source/exams_remote_data_source_contract.dart'
    as _i886;
import '../../features/exams/data/repo/exams_repo_impl.dart' as _i646;
import '../../features/exams/domain/model/exams_model.dart' as _i589;
import '../../features/exams/domain/repo/exams_repo_contract.dart' as _i827;
import '../../features/exams/domain/use_case/get_exams_by_category_use_case.dart'
    as _i401;
import '../../features/exams/presentation/view_model/cubit/exams_cubit.dart'
    as _i731;
import '../../features/exams/presentation/view_model/state/exams_state.dart'
    as _i924;
import '../../features/exams_questions/api/data_sources/exam_questions_remote_data_source_impl.dart'
    as _i264;
import '../../features/exams_questions/api/exams_questions_api_client/exam_questions_api_client.dart'
    as _i687;
import '../../features/exams_questions/data/data_sources/exam_questions_remote_data_source_contract.dart'
    as _i163;
import '../../features/exams_questions/data/repo/exam_questions_repo_impl.dart'
    as _i526;
import '../../features/exams_questions/domain/repo/exam_questions_repo_contract.dart'
    as _i261;
import '../../features/exams_questions/domain/use_cases/get_exam_questions_use_case.dart'
    as _i796;
import '../../features/exams_questions/presentation/view_model/cubit/exams_questions_cubit.dart'
    as _i764;
import '../../features/home/api/api_client/get_all_subjects_api_client.dart'
    as _i71;
import '../../features/home/api/data_sources/home_remote_data_source_imp.dart'
    as _i800;
import '../../features/home/data/data_source/home_remote_data_source_contract.dart'
    as _i936;
import '../../features/home/data/repo/home_repo_imp.dart' as _i197;
import '../../features/home/domain/repo/home_repo_contract.dart' as _i396;
import '../../features/home/domain/use_case/get_subjects_use_case.dart' as _i32;
import '../../features/home/presentation/view_model/cubit/home_cubit.dart'
    as _i1039;
import '../../features/splash/presentation/view_model/cubit/splash_cubit.dart'
    as _i369;
import '../base_state/base_state.dart' as _i96;
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
    gh.factory<_i148.ExamsLocalDataSourceContract>(
      () => _i896.ExamsLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i187.ForgetPasswordLocalDataSourceContract>(
      () => _i428.ForgetPasswordLocalDataSourceImpl(),
    );
    gh.factory<_i924.ExamsState>(
      () => _i924.ExamsState(
        examsState: gh<_i96.BaseState<List<_i589.ExamModel>>>(),
      ),
    );
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
      () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i188.ExamsApiClient>(
      () => _i188.ExamsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i251.LoginApiClient>(
      () => _i251.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i858.SignUpApiClient>(
      () => _i858.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i687.ExamQuetsionsApiClient>(
      () => _i687.ExamQuetsionsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i71.HomeApiClient>(() => _i71.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i183.LoginRemoteDataSourceContract>(
      () => _i182.LoginRemoteDataSourceImp(gh<_i251.LoginApiClient>()),
    );
    gh.lazySingleton<_i246.ForgetPasswordRemoteDataSourceContract>(
      () => _i159.ForgetPasswordRemoteDataSourceImpl(
        forgetPasswordApiClient: gh<_i478.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i724.LoginLocalDataSourceContract>(
      () => _i716.LoginLocalDataSourceImp(),
    );
    gh.factory<_i844.LoginRepoContract>(
      () => _i21.LoginRepoImp(
        gh<_i183.LoginRemoteDataSourceContract>(),
        gh<_i724.LoginLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i886.ExamsRemoteDataSourceContract>(
      () => _i895.ExamsRemoteDataSourceImpl(
        examsApiClient: gh<_i188.ExamsApiClient>(),
      ),
    );
    gh.factory<_i996.CheckUserLoggedInUseCase>(
      () => _i996.CheckUserLoggedInUseCase(gh<_i844.LoginRepoContract>()),
    );
    gh.factory<_i171.GetLoggedUserInfoUseCase>(
      () => _i171.GetLoggedUserInfoUseCase(gh<_i844.LoginRepoContract>()),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(gh<_i844.LoginRepoContract>()),
    );
    gh.singleton<_i827.ExamsRepoContract>(
      () => _i646.ExamsRepoImpl(
        examsRemoteDataSourceContract:
            gh<_i886.ExamsRemoteDataSourceContract>(),
        examsLocalDataSourceContract: gh<_i148.ExamsLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i539.SignUpRemoteDataSourceContract>(
      () => _i1052.SignUpRemoteDataSourceImpl(gh<_i858.SignUpApiClient>()),
    );
    gh.factory<_i936.HomeRemoteDataSourceContract>(
      () => _i800.HomeRemoteDataSourceImp(gh<_i71.HomeApiClient>()),
    );
    gh.lazySingleton<_i665.ForgetPasswordRepoContract>(
      () => _i610.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSourceContract:
            gh<_i246.ForgetPasswordRemoteDataSourceContract>(),
        forgetPasswordLocalDataSourceContract:
            gh<_i187.ForgetPasswordLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i163.ExamsQuestionsRemoteDataSourceContract>(
      () => _i264.ExamQuetsionsRemoteDataSourceImp(
        gh<_i687.ExamQuetsionsApiClient>(),
      ),
    );
    gh.factory<_i369.SplashCubit>(
      () => _i369.SplashCubit(
        gh<_i996.CheckUserLoggedInUseCase>(),
        gh<_i171.GetLoggedUserInfoUseCase>(),
      ),
    );
    gh.factory<_i401.GetExamsByCategoryUseCase>(
      () => _i401.GetExamsByCategoryUseCase(
        examsRepoContract: gh<_i827.ExamsRepoContract>(),
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
    gh.factory<_i396.HomeRepoContract>(
      () => _i197.HomeRepoImp(gh<_i936.HomeRemoteDataSourceContract>()),
    );
    gh.factory<_i731.ExamsCubit>(
      () => _i731.ExamsCubit(
        getExamsByCategoryUseCase: gh<_i401.GetExamsByCategoryUseCase>(),
      ),
    );
    gh.factory<_i366.SignUpRepoContract>(
      () => _i150.SignUpRepoImpl(gh<_i539.SignUpRemoteDataSourceContract>()),
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
    gh.factory<_i45.SignUpUseCase>(
      () => _i45.SignUpUseCase(gh<_i366.SignUpRepoContract>()),
    );
    gh.factory<_i32.GetSubjectsUseCase>(
      () => _i32.GetSubjectsUseCase(gh<_i396.HomeRepoContract>()),
    );
    gh.factory<_i261.ExamQuestionsRepoContract>(
      () => _i526.ExamQuestionsRepoImpl(
        gh<_i163.ExamsQuestionsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i667.SignUpCubit>(
      () => _i667.SignUpCubit(gh<_i45.SignUpUseCase>()),
    );
    gh.factory<_i1039.HomeCubit>(
      () => _i1039.HomeCubit(gh<_i32.GetSubjectsUseCase>()),
    );
    gh.factory<_i796.GetExamQuestionsUseCase>(
      () =>
          _i796.GetExamQuestionsUseCase(gh<_i261.ExamQuestionsRepoContract>()),
    );
    gh.factory<_i764.ExamsQuestionsCubit>(
      () => _i764.ExamsQuestionsCubit(gh<_i796.GetExamQuestionsUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
