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

import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/api/api_manager.dart' as _i909;
import '../features/auth/data/contracts/auth_offline_datasource.dart' as _i940;
import '../features/auth/data/contracts/auth_online_datasource.dart' as _i637;
import '../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i992;
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
import '../features/auth/presentation/ViewModel/login/login_view_model.dart'
    as _i862;

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
    gh.factory<_i940.AuthOfflineDatasource>(
        () => _i992.AuthOfflineDatasourceImpl());
    gh.singleton<_i909.ApiManager>(() => _i909.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i637.AuthOnlineDatasource>(
        () => _i757.AuthOnlineDatasourceImpl(gh<_i909.ApiManager>()));
    gh.factory<_i869.AuthRepository>(() => _i990.AuthRepoImpl(
          gh<_i637.AuthOnlineDatasource>(),
          gh<_i940.AuthOfflineDatasource>(),
        ));
    gh.factory<_i301.ForgotPasswordUseCase>(
        () => _i301.ForgotPasswordUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i496.LoginUseCase>(
        () => _i496.LoginUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i318.LoginUseCase>(
        () => _i318.LoginUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i906.ResetPasswordUseCase>(
        () => _i906.ResetPasswordUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i642.VerifyResetCodeUseCase>(
        () => _i642.VerifyResetCodeUseCase(gh<_i869.AuthRepository>()));
    gh.factory<_i862.LoginViewModel>(
        () => _i862.LoginViewModel(gh<_i496.LoginUseCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
