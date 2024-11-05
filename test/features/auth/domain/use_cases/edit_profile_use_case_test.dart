import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/edit_profile_use_case.dart';

import 'forgot_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test(
      'when call edit profile use case it should call edit  from auth repo.editProfile with correct parameters',
      () async {
        var mockAuthRepository =  MockAuthRepository();
        var useCase = EditProfileUseCase( mockAuthRepository);
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
        var mockedResult = Success<User>(user);
        provideDummy<ApiResult<User>>(mockedResult);
        when(mockAuthRepository.editProfile(user)).thenAnswer((_) async=> mockedResult,);
        var actual =await useCase.call(user);
        expect(actual, mockedResult);
        verify(mockAuthRepository.editProfile(user)).called(1);

      });
}
