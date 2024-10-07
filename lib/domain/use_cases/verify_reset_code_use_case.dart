
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/domain/common/api_result.dart';
import 'package:online_exam/domain/repositories/auth_repository.dart';
@injectable
class VerifyResetCodeUseCase {
  AuthRepository authRepository;
  VerifyResetCodeUseCase(this.authRepository);
  Future<ApiResult<VerifyResetCodeResponse>> invoke(String resetCode){
    return  authRepository.verifyResetCode(resetCode);
  }
}
