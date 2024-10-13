import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<ApiResult<AuthResponse>> register(RegisterRequest body) async {
    return await authRepository.signeUp(body);
  }
}
