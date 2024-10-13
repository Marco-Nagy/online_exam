
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
@injectable
class VerifyResetCodeUseCase {
  AuthRepository authRepository;
  VerifyResetCodeUseCase(this.authRepository);

  Future<ApiResult<VerifyResetCodeResponse>> invoke(
      VerifyResetCodeRequest body) {
    return authRepository.verifyResetCode(body);
  }
}
