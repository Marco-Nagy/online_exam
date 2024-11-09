import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/edit_profile_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/get_profile_data_use_case.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_screen_actions.dart';

import 'edit_profile_cubit_test.mocks.dart';

@GenerateMocks(
    [GetProfileDataUseCase, EditProfileUseCase, ChangePasswordUseCase])
void main() {
  late EditProfileCubit editProfileCubit;
  late GetProfileDataUseCase getProfileDataCase;
  late EditProfileUseCase editProfileCase;
  late ChangePasswordUseCase changePasswordCase;
  late ChangePasswordRequest changePasswordRequest ;

  setUp(() {
  getProfileDataCase = MockGetProfileDataUseCase();
  editProfileCase = MockEditProfileUseCase();
  changePasswordCase = MockChangePasswordUseCase();
  editProfileCubit = EditProfileCubit(
      getProfileDataCase, editProfileCase, changePasswordCase);
 changePasswordRequest   = ChangePasswordRequest(
    'old_password',
    'new_password',
    'new_password',
    );

},);
  blocTest<EditProfileCubit, EditProfileState>(
    'when call do intent with getProfileData it should call'
    'getProfileDataUseCase and change state to success ',
    setUp: () {
      var result = Success(User());
      provideDummy<ApiResult<User>>(result);
      when(getProfileDataCase.call()).thenAnswer((_) async=> result,);

    },
    build: () {
      return editProfileCubit;
    },
    act: (cubit) => cubit.doAction(GetProfileDataAction()),
    expect: () {
      verify(getProfileDataCase.call()).called(1);
      return [
        isA<ProfileLoading>(),
        isA<GetProfileDataSuccess>()
      ];
    },
  );
  blocTest<EditProfileCubit, EditProfileState>(
    'when call do intent with editProfileData it should call'
    'editProfileDataUseCase and change state to success ',
    setUp: () {
      var result = Success(User());
      provideDummy<ApiResult<User>>(result);
      when(editProfileCase.call(UserRequest())).thenAnswer((_) async=> result,);
    },
    build: () {
      return editProfileCubit;
    },
    act: (cubit) => cubit.doAction(UpdateProfileDataAction(userBody: UserRequest())),
    expect: () {
      verify(editProfileCase.call(UserRequest())).called(1);
      return [
        isA<ProfileLoading>(),
        isA<EditProfileSuccess>()
      ];
    },
  );
  blocTest<EditProfileCubit, EditProfileState>(
    'when call do intent with changePassword it should call'
    'changePasswordUseCase and change state to success ',
    setUp: () {
      var result = Success(User());
      provideDummy<ApiResult<User>>(result);
      when(changePasswordCase.call(changePasswordRequest)).thenAnswer((_) async=> result,);
    },
    build: () {
      return editProfileCubit;
    },
    act: (cubit) => cubit.doAction(ChangePasswordAction(body: changePasswordRequest)),
    expect: () {
      verify(changePasswordCase.call(changePasswordRequest)).called(1);
      return [
        isA<ProfileLoading>(),
        isA<ChangePasswordSuccess>()
      ];
    },
  );
}
