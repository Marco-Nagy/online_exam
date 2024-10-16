import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/contracts/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository{
  AuthOnlineDatasource onlineDatasource; // DIP -> DI

  AuthRepoImpl(this.onlineDatasource, );

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(ForgetPasswordRequest body) {
    return onlineDatasource.forgotPassword(body);
  }

  @override
  Future<ApiResult<AuthResponse>> login(SignInRequest body) {
   return onlineDatasource.login(body);
  }

  @override
  Future<ApiResult<AuthResponse>> resetPassword(ResetPasswordRequest body) {
   return onlineDatasource.resetPassword(body);
  }

  @override
  Future<ApiResult<AuthResponse>> signeUp(RegisterRequest body) {
 return onlineDatasource.signeUp(body);
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest body) {
return onlineDatasource.verifyResetCode(body);
  }

  // }
}
