import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam/core/networking/error/error_contract.dart';

import 'ErrorModel.dart';

class ErrorHandler {
  final String errorMessage;

  ErrorHandler(this.errorMessage);

  // Handle the exception and return an ErrorModel
  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.receiveTimeout:
          return ErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.sendTimeout:
          return ErrorModel(
              message: "Send timeout in connection with the server");
        case DioExceptionType.unknown:
          return ErrorModel(
              message:
              "Connection to the server failed due to internet connection");
        case DioExceptionType.badResponse:
        // Ensure we convert response data to ErrorModel
          final errorModel = ErrorModel.fromMap(error.response?.data as Map<String, dynamic>);
          return ErrorHandler.fromResponse(error.response?.statusCode, errorModel);
        default:
          return ErrorModel(message: "Something went wrong");
      }
    } else if (error is IOException) {
      return ErrorModel(message: "No internet connection");
    } else {
      return ErrorModel(message: "Unknown error occurred");
    }
  }

  // This method should return ErrorModel, not ErrorHandler
  static ErrorModel fromResponse(int? statusCode, ErrorModel response) {
    switch (statusCode) {
      case 401:
      case 402:
      case 403:
        return ErrorModel(message: response.message ?? 'Unauthorized access');
      case 404:
        return ErrorModel(message: 'Your request was not found, please try later!');
      case 500:
        return ErrorModel(message: 'Internal server error, please try later!');
      default:
        return ErrorModel(message: 'Oops! There was an error, please try again');
    }
  }
}

