import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam/domain/common/api_result.dart';
import 'package:online_exam/domain/common/custom_exception.dart';

Future<ApiResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (ex) {
    return Fail(NoInternetError());
  } on IOException catch (ex) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    return Fail(DioHttpException(ex));
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
