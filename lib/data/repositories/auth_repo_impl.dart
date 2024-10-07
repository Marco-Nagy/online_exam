import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth_offline_datasource.dart';
import 'package:online_exam/data/contracts/auth_online_datasource.dart';
import 'package:online_exam/data/models/response/AuthResponse.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';
import 'package:online_exam/domain/repositories/auth_repository.dart';
@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository{
  AuthOnlineDatasource onlineDatasource; // DIP -> DI
  AuthOfflineDatasource offlineDatasource;

  AuthRepoImpl(this.onlineDatasource, this.offlineDatasource);

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email) {
    return onlineDatasource.forgotPassword(email);
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(String resetCode) {
   return onlineDatasource.verifyResetCode(resetCode);
  }

  @override
  Future<ApiResult<AuthResponse>> resetPassword(String email, String newPassword) {
    return onlineDatasource.resetPassword(email, newPassword);
  }
}
