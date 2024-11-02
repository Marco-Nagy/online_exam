// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/data_sources/auth_online_datasource.dart'
    as _i901;
import '../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i757;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i301;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i496;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i318;
import '../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i906;
import '../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i642;
import '../features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart'
    as _i25;
import '../features/auth/presentation/login/ViewModel/login_view_model.dart'
    as _i1070;
import '../features/auth/presentation/register/ViewModel/register_cubit.dart'
    as _i541;
import '../features/exam/data/data_sources/exam_online_datasource.dart'
    as _i1006;
import '../features/exam/data/data_sources/exam_online_datasource_impl.dart'
    as _i167;
import '../features/exam/data/repositories/exam_repo_impl.dart' as _i66;
import '../features/exam/domain/repositories/exam_repo.dart' as _i87;
import '../features/exam/domain/use_cases/get_all_exams_use_case.dart' as _i984;
import '../features/exam/presentation/viewModel/exam_cubit.dart' as _i1060;
import '../features/questions/data/data_sources/questions_oline_data_source.dart'
    as _i819;
import '../features/questions/data/data_sources/questions_oline_data_source_impl.dart'
    as _i290;
import '../features/questions/data/repositories/questions_repo_impl.dart'
    as _i852;
import '../features/questions/domain/repositories/questions_repo.dart' as _i828;
import '../features/questions/domain/use_cases/get_questions_for_exam_use_case.dart'
    as _i696;
import '../features/survey/data/data_sources/remote_data_source/survey_api_remote_data_source.dart'
    as _i252;
import '../features/survey/data/data_sources/remote_data_source/survey_remote_data_source.dart'
    as _i609;
import '../features/survey/data/repositories/survey_repository_impl.dart'
    as _i900;
import '../features/survey/domain/repositories/survey_repositories.dart'
    as _i18;
import '../features/survey/domain/use_cases/get_subjects.dart' as _i730;
import '../features/survey/presentation/cubit/survey_cubit.dart' as _i579;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final registerModule = _$RegisterModule();
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.lazySingleton<_i609.SurveyRemoteDataSource>(
        () => _i252.SurveyApiRemoteDataSource(gh<_i282.ApiManager>()));
    gh.factory<_i1006.ExamOnlineDatasource>(
        () => _i167.ExamOnlineDatasourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i901.AuthOnlineDatasource>(
        () => _i757.AuthOnlineDatasourceImpl(gh<_i282.ApiManager>()));
    gh.lazySingleton<_i18.SurveyRepository>(
        () => _i900.SurveyRepositoryIml(gh<_i609.SurveyRemoteDataSource>()));
    gh.factory<_i869.AuthRepository>(
        () => _i990.AuthRepoImpl(gh<_i901.AuthOnlineDatasource>()));
    gh.factory<_i819.QuestionsOlineDataSource>(
        () => _i290.QuestionsOlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i87.ExamRepo>(
        () => _i66.ExamRepoImpl(gh<_i1006.ExamOnlineDatasource>()));
    gh.factory<_i730.GetSubjectsUseCase>(
        () => _i730.GetSubjectsUseCase(gh<_i18.SurveyRepository>()));
    gh.factory<_i301.ForgotPasswordUseCase>(
        () => _i301.ForgotPasswordUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i496.LoginUseCase>(
        () => _i496.LoginUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i318.RegisterUseCase>(
        () => _i318.RegisterUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i906.ResetPasswordUseCase>(
        () => _i906.ResetPasswordUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i642.VerifyResetCodeUseCase>(
        () => _i642.VerifyResetCodeUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i984.GetAllExamsUseCase>(
        () => _i984.GetAllExamsUseCase(gh<_i87.ExamRepo>()));
    gh.factory<_i25.ForgetPasswordCubit>(() => _i25.ForgetPasswordCubit(
          gh<_i301.ForgotPasswordUseCase>(),
          gh<_i642.VerifyResetCodeUseCase>(),
          gh<_i906.ResetPasswordUseCase>(),
        ));
    gh.factory<_i828.QuestionsRepo>(
        () => _i852.QuestionsRepoImpl(gh<_i819.QuestionsOlineDataSource>()));
    gh.factory<_i1070.LoginViewModel>(
        () => _i1070.LoginViewModel(gh<_i496.LoginUseCase>()));
    gh.factory<_i541.RegisterCubit>(
        () => _i541.RegisterCubit(gh<_i318.RegisterUseCase>()));
    gh.factory<_i579.SubjectCubit>(
        () => _i579.SubjectCubit(gh<_i730.GetSubjectsUseCase>()));
    gh.factory<_i1060.ExamCubit>(
        () => _i1060.ExamCubit(gh<_i984.GetAllExamsUseCase>()));
    gh.factory<_i696.GetQuestionsForExamUseCase>(
        () => _i696.GetQuestionsForExamUseCase(gh<_i828.QuestionsRepo>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
