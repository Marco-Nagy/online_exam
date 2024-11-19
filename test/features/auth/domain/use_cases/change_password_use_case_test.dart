import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/change_password_use_case.dart';

import 'forgot_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test(
      'when call change password use case it should call edit  from auth repo.changePassword with correct parameters',
      () async {
    final authRepository = MockAuthRepository();
    final changePasswordUseCase = ChangePasswordUseCase(authRepository);

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
    var body = ChangePasswordRequest(
      'old_password',
      'new_password',
      'new_password',
    );
    provideDummy<DataResult<User>>(mockedResult);
    when(authRepository.changePassword(body))
        .thenAnswer((args) async => mockedResult);

    var actual = await changePasswordUseCase.call(body);
    expect(actual, mockedResult);
    verify(authRepository.changePassword(body)).called(1);
  });
}
