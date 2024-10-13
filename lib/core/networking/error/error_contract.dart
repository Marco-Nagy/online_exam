
import 'package:dio/dio.dart';

import 'ErrorModel.dart';

sealed class ErrorContract implements Exception{
}

class NetworkException implements ErrorContract{
DioException exception;

NetworkException({required this.exception});
}

class ServerException implements ErrorContract{
  ErrorModel errorModel;

  ServerException(this.errorModel);
}

class NoInternetError implements ErrorContract{}
class IOExceptionError implements ErrorContract{}