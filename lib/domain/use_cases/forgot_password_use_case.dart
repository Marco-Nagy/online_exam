import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';
import 'package:online_exam/domain/repositories/auth_repository.dart';

@injectable
class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  Future<ApiResult<ForgotPasswordResponse>> invoke(String email) {
    return authRepository.forgotPassword(email);
  }
}
