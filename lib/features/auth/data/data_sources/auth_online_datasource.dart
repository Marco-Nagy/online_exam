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
Future<DataResult<ForgotPasswordResponse>> forgotPassword(ForgetPasswordRequest body);
Future<DataResult<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest body);
Future<DataResult<AuthResponse>> resetPassword(ResetPasswordRequest body);
Future<DataResult<User>> login(SignInRequest body);
Future<DataResult<User>> signeUp(RegisterRequest body);
Future<DataResult<User>> getProfileData();
Future<DataResult<User>> editProfile(UserRequest user);
Future<DataResult<User>> changePassword(ChangePasswordRequest body);

}
