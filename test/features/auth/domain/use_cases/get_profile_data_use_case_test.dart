import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/get_profile_data_use_case.dart';

import 'forgot_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test(
      'when call get profile use case it should call getProfileData from auth repo.getProfileData with ',
      () async {
    var user = User(
        email: 'test@example.com',
        username: 'testUser',
        firstName: 'Test',
        lastName: 'User',
        phone: '1234567890',
        role: 'student',
        token: 'testToken',
        isVerified: true,
        id: '1');

    var mockAuthRepository = MockAuthRepository();
    var getProfileData = GetProfileDataUseCase(mockAuthRepository);

    var mockedResult = Success<User>(user);
    provideDummy<DataResult<User>>(mockedResult);
    when(mockAuthRepository.getProfileData())
        .thenAnswer((_) async => mockedResult);
    var result = await getProfileData.call();
    expect(result, mockedResult);
    verify(mockAuthRepository.getProfileData()).called(1);
  });
}
