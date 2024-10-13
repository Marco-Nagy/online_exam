import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_constants.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
@factoryMethod
factory  ApiManager(Dio dio)= _ApiManager;
@POST(ApiConstants.forgotPasswordApi)
  Future<ForgotPasswordResponse> forgotPassword(@Body() ForgetPasswordRequest body) ;
@POST(ApiConstants.verifyResetCodeApi)
  Future<VerifyResetCodeResponse> verifyResetCode(@Body() VerifyResetCodeRequest body);
@PUT(ApiConstants.resetPasswordApi)
  Future<AuthResponse> resetPassword(@Body() ResetPasswordRequest body);
@POST(ApiConstants.signInApi)
Future<AuthResponse> signIn(@Body() SignInRequest user);
@POST(ApiConstants.registerApi)
Future<AuthResponse> signUp(@Body() RegisterRequest user);

}
