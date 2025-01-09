import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GetProfileDataUseCase {
  AuthRepository authRepository;

  GetProfileDataUseCase(this.authRepository);

  Future<DataResult<User>> call() {
    return  authRepository.getProfileData();
  }
}
