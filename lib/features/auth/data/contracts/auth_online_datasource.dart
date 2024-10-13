import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';

abstract class AuthOnlineDatasource {
Future<ApiResult<ForgotPasswordResponse>> forgotPassword(ForgetPasswordRequest body);
Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest body);
Future<ApiResult<AuthResponse>> resetPassword(ResetPasswordRequest body);
Future<ApiResult<AuthResponse>> login(SignInRequest body);
Future<ApiResult<AuthResponse>> signeUp(RegisterRequest body);
}
