import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

class AuthMappers {
  static User toUserEntity(AuthResponse response) {
    if (response.user == null) {
      return User(
          email: '',
        username: '',
          firstName: '',
          isVerified: false,
          id: '',
          lastName: '',
          phone: '',
          role:'',token: '',);
    }
    return User(
      id: response.user!.id!,
     email: response.user!.email,
      username: response.user!.username,
      firstName: response.user!.firstName,
      lastName: response.user!.lastName,
      isVerified: response.user!.isVerified,
      phone: response.user!.phone,
      role: response.user!.role,
      token: response.token,

    );
  }
}
