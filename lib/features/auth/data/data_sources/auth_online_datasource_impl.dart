import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/api/api_manager.dart';
import 'package:online_exam/features/auth/data/contracts/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';

@Injectable(as:AuthOnlineDatasource )
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource{
  final ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(ForgetPasswordRequest body) {
    return executeApi<ForgotPasswordResponse>(() async {
      return await apiManager.forgotPassword(body);
    });
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest body) {
    return executeApi<VerifyResetCodeResponse>(() async {
      return await apiManager.verifyResetCode(body);
    });
  }

  @override
  Future<ApiResult<AuthResponse>> resetPassword(ResetPasswordRequest body) {
    return executeApi<AuthResponse>(() async {
      return await apiManager.resetPassword(body);
    });
  }

  @override
  Future<ApiResult<AuthResponse>> login(SignInRequest body) {
   return executeApi(() async {
     return await apiManager.signIn(body);
   },);
  }

  @override
  Future<ApiResult<AuthResponse>> signeUp(RegisterRequest body) {
  return executeApi(() async {
    return await apiManager.signUp(body);
  });
  }
}
