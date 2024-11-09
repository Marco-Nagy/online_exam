import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

abstract class AuthOnlineDatasource {
Future<ApiResult<ForgotPasswordResponse>> forgotPassword(ForgetPasswordRequest body);
Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest body);
Future<ApiResult<AuthResponse>> resetPassword(ResetPasswordRequest body);
Future<ApiResult<User>> login(SignInRequest body);
Future<ApiResult<User>> signeUp(RegisterRequest body);
Future<ApiResult<User>> getProfileData();
Future<ApiResult<User>> editProfile(UserRequest user);
Future<ApiResult<User>> changePassword(ChangePasswordRequest body);

}
