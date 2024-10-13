import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:online_exam/di/di.dart';
import 'api_constants.dart';

@module
abstract class NetworkFactory {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      baseUrl: ApiConstants.baseUrl,
    );
    dio.interceptors.add(getIt<LogInterceptor>());
    return dio;
  }
  LogInterceptor providerInterceptor(){
    return LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
  }
}

abstract class NetworkModule {




}