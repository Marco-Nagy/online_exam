import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';


@injectable
class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  Future<ApiResult<ForgotPasswordResponse>> invoke(ForgetPasswordRequest body) {
    return authRepository.forgotPassword(body);
  }
}
