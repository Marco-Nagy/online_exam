import 'package:dio/dio.dart';

class CustomException implements Exception{
  String? serverMessage;
  int? statusCode;

  CustomException(this.serverMessage, this.statusCode);
}
class DioHttpException implements Exception{
  DioException? exception;

  DioHttpException(this.exception);
}
class NoInternetError implements Exception{}
