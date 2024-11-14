import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';

@injectable
class EditProfileUseCase {
  AuthRepository authRepository;

  EditProfileUseCase(this.authRepository);

  Future<ApiResult<User>> call(UserRequest user) {
    return  authRepository.editProfile(user);
  }
}
