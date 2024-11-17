import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'common/api_result.dart';
import 'common/custom_exception.dart';

Future<DataResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on SocketException catch (e) {
    return Fail<T>(e);
  } on TimeoutException catch (e) {
    return Fail<T>(e);
  } on HttpException catch (e) {
    return Fail<T>(e);
  } on DioException catch (e) {
    return Fail<T>(e);
  } on FormatException catch (e) {
    return Fail<T>(e);
  } on IOException {
    return Fail<T>(NoInternetError());
  } catch (e) {
    return Fail<T>(e as Exception);
  }
}

@singleton
class DataSourceExecution {
  Future<DataResult<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      return Success<T>(response);
    } on SocketException catch (e) {
      return Fail<T>(e);
    } on TimeoutException catch (e) {
      return Fail<T>(e);
    } on HttpException catch (e) {
      return Fail<T>(e);
    } on DioException catch (e) {
      return Fail<T>(e);
    } on FormatException catch (e) {
      return Fail<T>(e);
    } on IOException {
      return Fail<T>(NoInternetError());
    } catch (e) {
      return Fail<T>(e as Exception);
    }
  }
}
