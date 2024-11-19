import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<DataResult<User>> call(RegisterRequest body) async {
    return await authRepository.signeUp(body);
  }
}
