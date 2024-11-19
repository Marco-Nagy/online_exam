import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ChangePasswordUseCase {
  AuthRepository authRepository;

  ChangePasswordUseCase(this.authRepository);

  Future<DataResult<User>> call(ChangePasswordRequest body) {
    return  authRepository.changePassword(body);
  }
}
