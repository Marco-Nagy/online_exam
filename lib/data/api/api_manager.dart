import 'package:dio/dio.dart';
import 'package:online_exam/data/models/response/AuthResponse.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/data/models/response/VerifyResetCodeResponse.dart';

import 'api_constants.dart';

class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl
    ));  }

  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    var response = await _dio.post(ApiConstants.forgotPasswordApi,
        data: {"email": email});
    return ForgotPasswordResponse.fromJson(response.data);
  }

  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode) async {
    var response = await _dio.post(ApiConstants.verifyResetCodeApi,
        data: {"resetCode": resetCode});
    return VerifyResetCodeResponse.fromJson(response.data);
  }

  Future<AuthResponse> resetPassword(String email,String newPassword) async {
    var response = await _dio.put(ApiConstants.resetPasswordApi,
        data: {
          "email":email,
          "newPassword": newPassword
        });
    return AuthResponse.fromJson(response.data);
  }
}
