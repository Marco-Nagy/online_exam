// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/contracts/auth_offline_datasource.dart' as _i62;
import '../data/contracts/auth_online_datasource.dart' as _i693;
import '../data/data_sources/auth_offline_datasource_impl.dart' as _i372;
import '../data/data_sources/auth_online_datasource_impl.dart' as _i963;
import '../data/repositories/auth_repo_impl.dart' as _i743;
import '../domain/repositories/auth_repository.dart' as _i800;

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
    gh.factory<_i693.AuthOnlineDatasource>(
        () => _i963.AuthOnlineDatasourceImpl());
    gh.factory<_i62.AuthOfflineDatasource>(
        () => _i372.AuthOfflineDatasourceImpl());
    gh.factory<_i800.AuthRepository>(() => _i743.AuthRepoImpl());
    return this;
  }
}
