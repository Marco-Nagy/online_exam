import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl
    ));  }
}
