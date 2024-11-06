import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/edit_profile_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/get_profile_data_use_case.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_screen_actions.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(
    this.getProfileDataCase,
    this.editProfileCase,
    this.changePasswordCase,
  ) : super(EditProfileInitial());
  final GetProfileDataUseCase getProfileDataCase;
  final EditProfileUseCase editProfileCase;
  final ChangePasswordUseCase changePasswordCase;

  void doAction(EditProfileScreenActions action) {
    switch (action) {
      case GetProfileDataAction():
        _getProfileData();
      case UpdateProfileDataAction():
        _editProfile(action.user);
      case ChangePasswordAction():
        _changePassword(action.body);
    }
  }

  Future<void> _getProfileData() async {
    emit(ProfileLoading());
    var result = await getProfileDataCase();
    switch (result) {
      case Success<User>():
        emit(GetProfileDataSuccess(user: result.data));
      case Fail<User>():
        emit(ProfileError(errorModel: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _editProfile(User user) async {
    emit(ProfileLoading());
    var result = await editProfileCase(user);
    switch (result) {
      case Success<User>():
        emit(EditProfileSuccess(result.data));
      case Fail<User>():
        emit(ProfileError(errorModel: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _changePassword(ChangePasswordRequest body) async {
    emit(ProfileLoading());
    var result = await changePasswordCase(body);
    switch (result) {
      case Success<User>():
        emit(ChangePasswordSuccess(result.data));
      case Fail<User>():
        emit(ProfileError(errorModel: ErrorHandler.handle(result.exception!)));
    }
  }
}
