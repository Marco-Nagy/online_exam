import 'package:online_exam/data/models/response/AuthResponse.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';

abstract class AuthOnlineDatasource {
Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email);
Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(String resetCode);
Future<ApiResult<AuthResponse>> resetPassword(String email, String newPassword);




}
