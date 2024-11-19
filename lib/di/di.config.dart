// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i5;

import 'package:dio/dio.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i7;

import '../core/locale_database/isar_module.dart' as _i48;
import '../core/networking/api/api_manager.dart' as _i8;
import '../core/networking/api_execute.dart' as _i3;
import '../core/networking/common/regestet_context_module.dart' as _i49;
import '../core/networking/network_factory.dart' as _i47;
import '../features/auth/data/data_sources/auth_online_datasource.dart' as _i9;
import '../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i10;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i12;
import '../features/auth/domain/repositories/auth_repository.dart' as _i11;
import '../features/auth/domain/use_cases/change_password_use_case.dart'
    as _i13;
import '../features/auth/domain/use_cases/edit_profile_use_case.dart' as _i14;
import '../features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i20;
import '../features/auth/domain/use_cases/get_profile_data_use_case.dart'
    as _i22;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i23;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i31;
import '../features/auth/domain/use_cases/reset_password_use_case.dart' as _i32;
import '../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i38;
import '../features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart'
    as _i39;
import '../features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart'
    as _i41;
import '../features/auth/presentation/login/ViewModel/login_view_model.dart'
    as _i24;
import '../features/auth/presentation/register/ViewModel/register_cubit.dart'
    as _i45;
import '../features/exam/data/data_sources/exam_online_datasource.dart' as _i16;
import '../features/exam/data/data_sources/exam_online_datasource_impl.dart'
    as _i17;
import '../features/exam/data/repositories/exam_repo_impl.dart' as _i19;
import '../features/exam/domain/repositories/exam_repo.dart' as _i18;
import '../features/exam/domain/use_cases/get_all_exams_use_case.dart' as _i21;
import '../features/exam/presentation/viewModel/exam_cubit.dart' as _i40;
import '../features/questions/data/data_sources/offline/exam_offline_database.dart'
    as _i15;
import '../features/questions/data/data_sources/offline/question_offline_datasource_impl.dart'
    as _i26;
import '../features/questions/data/data_sources/offline/questions_offline_datasource.dart'
    as _i25;
import '../features/questions/data/data_sources/online/questions_oline_data_source.dart'
    as _i27;
import '../features/questions/data/data_sources/online/questions_oline_data_source_impl.dart'
    as _i28;
import '../features/questions/data/repositories/questions_repo_impl.dart'
    as _i30;
import '../features/questions/domain/repositories/questions_repo.dart' as _i29;
import '../features/questions/domain/use_cases/get_questions_for_exam_use_case.dart'
    as _i42;
import '../features/questions/domain/use_cases/submit_exam_use_case.dart'
    as _i33;
import '../features/questions/presentation/viewModel/questions/question_cubit.dart'
    as _i44;
import '../features/survey/data/data_sources/remote_data_source/survey_api_remote_data_source.dart'
    as _i35;
import '../features/survey/data/data_sources/remote_data_source/survey_remote_data_source.dart'
    as _i34;
import '../features/survey/data/repositories/survey_repository_impl.dart'
    as _i37;
import '../features/survey/domain/repositories/survey_repositories.dart'
    as _i36;
import '../features/survey/domain/use_cases/get_subjects.dart' as _i43;
import '../features/survey/presentation/cubit/survey_cubit.dart' as _i46;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final isarModule = _$IsarModule();
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.DataSourceExecution>(() => _i3.DataSourceExecution());
    gh.lazySingleton<_i4.Dio>(() => networkFactory.provideDio());
    await gh.factoryAsync<_i5.Directory>(
      () => isarModule.directoryProvider,
      preResolve: true,
    );
    gh.singleton<_i6.GlobalKey<_i6.NavigatorState>>(
        () => registerModule.navigatorKey);
    await gh.factoryAsync<_i7.Isar>(
      () => isarModule.isarProvider,
      preResolve: true,
    );
    gh.factory<_i4.LogInterceptor>(() => networkFactory.providerInterceptor());
    gh.singleton<_i8.ApiManager>(() => _i8.ApiManager(gh<_i4.Dio>()));
    gh.factory<_i9.AuthOnlineDatasource>(
        () => _i10.AuthOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i11.AuthRepository>(
        () => _i12.AuthRepoImpl(gh<_i9.AuthOnlineDatasource>()));
    gh.factory<_i13.ChangePasswordUseCase>(
        () => _i13.ChangePasswordUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i14.EditProfileUseCase>(
        () => _i14.EditProfileUseCase(gh<_i11.AuthRepository>()));
    gh.singleton<_i15.ExamOfflineDatabase>(
        () => _i15.ExamOfflineDatabase(gh<_i7.Isar>()));
    gh.factory<_i16.ExamOnlineDatasource>(
        () => _i17.ExamOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i18.ExamRepo>(
        () => _i19.ExamRepoImpl(gh<_i16.ExamOnlineDatasource>()));
    gh.factory<_i20.ForgotPasswordUseCase>(
        () => _i20.ForgotPasswordUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i21.GetAllExamsUseCase>(
        () => _i21.GetAllExamsUseCase(gh<_i18.ExamRepo>()));
    gh.factory<_i22.GetProfileDataUseCase>(
        () => _i22.GetProfileDataUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(gh<_i23.LoginUseCase>()));
    gh.factory<_i25.QuestionsOfflineDatasource>(() =>
        _i26.QuestionOfflineDatasourceImpl(gh<_i15.ExamOfflineDatabase>()));
    gh.factory<_i27.QuestionsOlineDataSource>(
        () => _i28.QuestionsOlineDataSourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i29.QuestionsRepo>(() => _i30.QuestionsRepoImpl(
          gh<_i27.QuestionsOlineDataSource>(),
          gh<_i25.QuestionsOfflineDatasource>(),
        ));
    gh.factory<_i31.RegisterUseCase>(
        () => _i31.RegisterUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i32.ResetPasswordUseCase>(
        () => _i32.ResetPasswordUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i33.SubmitExamUseCase>(
        () => _i33.SubmitExamUseCase(gh<_i29.QuestionsRepo>()));
    gh.lazySingleton<_i34.SurveyRemoteDataSource>(
        () => _i35.SurveyApiRemoteDataSource(gh<_i8.ApiManager>()));
    gh.lazySingleton<_i36.SurveyRepository>(
        () => _i37.SurveyRepositoryIml(gh<_i34.SurveyRemoteDataSource>()));
    gh.factory<_i38.VerifyResetCodeUseCase>(
        () => _i38.VerifyResetCodeUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i39.EditProfileCubit>(() => _i39.EditProfileCubit(
          gh<_i22.GetProfileDataUseCase>(),
          gh<_i14.EditProfileUseCase>(),
          gh<_i13.ChangePasswordUseCase>(),
        ));
    gh.factory<_i40.ExamCubit>(
        () => _i40.ExamCubit(gh<_i21.GetAllExamsUseCase>()));
    gh.factory<_i41.ForgetPasswordCubit>(() => _i41.ForgetPasswordCubit(
          gh<_i20.ForgotPasswordUseCase>(),
          gh<_i38.VerifyResetCodeUseCase>(),
          gh<_i32.ResetPasswordUseCase>(),
        ));
    gh.factory<_i42.GetQuestionsForExamUseCase>(
        () => _i42.GetQuestionsForExamUseCase(gh<_i29.QuestionsRepo>()));
    gh.factory<_i43.GetSubjectsUseCase>(
        () => _i43.GetSubjectsUseCase(gh<_i36.SurveyRepository>()));
    gh.factory<_i44.QuestionCubit>(() => _i44.QuestionCubit(
          gh<_i42.GetQuestionsForExamUseCase>(),
          gh<_i33.SubmitExamUseCase>(),
        ));
    gh.factory<_i45.RegisterCubit>(
        () => _i45.RegisterCubit(gh<_i31.RegisterUseCase>()));
    gh.factory<_i46.SubjectCubit>(
        () => _i46.SubjectCubit(gh<_i43.GetSubjectsUseCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i47.NetworkFactory {}

class _$IsarModule extends _i48.IsarModule {}

class _$RegisterModule extends _i49.RegisterModule {}
