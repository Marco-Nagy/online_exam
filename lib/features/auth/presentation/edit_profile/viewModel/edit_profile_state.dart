part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();
}

final class EditProfileInitial extends EditProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends EditProfileState {
  @override
  List<Object?> get props => [];
}

final class ProfileError extends EditProfileState {
  final ErrorModel errorModel;
  const ProfileError({required this.errorModel});

  @override
  List<Object?> get props => [errorModel];
}

final class GetProfileDataSuccess extends EditProfileState {
  final User user;
  const GetProfileDataSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class EditProfileSuccess extends EditProfileState {
  final User user;
  const EditProfileSuccess(this.user);
  @override
  List<Object?> get props =>[user];
}

final class ChangePasswordSuccess extends EditProfileState {
  final User user;
  const ChangePasswordSuccess(this.user);
  @override
  List<Object?> get props =>[user];
}