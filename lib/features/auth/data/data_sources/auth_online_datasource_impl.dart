import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/mappers/auth_mappers.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

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
  Future<ApiResult<User>> login(SignInRequest body) {
   return executeApi(() async {
     var response = await apiManager.signIn(body);
     return AuthMappers.toUserEntity(response);
   },);
  }

  @override
  Future<ApiResult<User>> signeUp(RegisterRequest body) {
  return executeApi(() async {
    var response = await apiManager.signUp(body);
    return   AuthMappers.toUserEntity(response);
  });
  }

  @override
  Future<ApiResult<User>> getProfileData() async {
    return executeApi(() async {
      var response = await apiManager.getProfileData();
      return AuthMappers.toUserEntity(response);
    });
  }

  @override
  Future<ApiResult<User>> editProfile(User user) {
    return executeApi(() async {
      var response = await apiManager.editProfile(user);
      return AuthMappers.toUserEntity(response);
    });
  }

  @override
  Future<ApiResult<User>> changePassword(ChangePasswordRequest body) {
    return executeApi(() async {
      var response = await apiManager.changePassword(body);
      return AuthMappers.toUserEntity(response);
    });
  }
}
