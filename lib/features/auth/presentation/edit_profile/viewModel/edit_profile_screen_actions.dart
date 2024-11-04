import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

sealed class EditProfileScreenActions {
}

class GetProfileDataAction implements EditProfileScreenActions{}

class UpdateProfileDataAction implements EditProfileScreenActions {
  final User user;
  UpdateProfileDataAction({required this.user});
}
class ChangePasswordAction implements EditProfileScreenActions{
  final ChangePasswordRequest body;
  ChangePasswordAction({required this.body});
}
