import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_execute.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/auth_online_datasource.dart';
import 'package:online_exam/data/models/response/AuthResponse.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';

@Injectable(as:AuthOnlineDatasource )
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource{
  final ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email) {
    return executeApi<ForgotPasswordResponse>(() async {
      return await apiManager.forgotPassword(email);
    });
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(String resetCode) {
    return executeApi<VerifyResetCodeResponse>(() async {
      return await apiManager.verifyResetCode(resetCode);
    });
  }

  @override
  Future<ApiResult<AuthResponse>> resetPassword(
      String email, String newPassword) {
    return executeApi<AuthResponse>(() async {
      return await apiManager.resetPassword(email, newPassword);
    });
  }
}
