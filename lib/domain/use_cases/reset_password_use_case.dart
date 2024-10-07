import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/response/AuthResponse.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';
import 'package:online_exam/domain/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<ApiResult<AuthResponse>> invoke(String email,String newPassword) {
    return authRepository.resetPassword(email,newPassword);
  }
}
