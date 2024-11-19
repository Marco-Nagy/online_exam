import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/login_use_case.dart';

import 'change_password_use_case_test.mocks.dart';
@GenerateMocks([AuthRepository])
void main() {
  test('when call (call method) it should get authRepository.login with correct parameters', () async{
    var authRepo = MockAuthRepository();
    var loginUseCase = LoginUseCase(authRepo);
    var body = SignInRequest();
    var mockedResult = Success<User>(User());
    provideDummy<DataResult<User>>(mockedResult);
    when(authRepo.login(body)).thenAnswer((_) async => mockedResult,);
    var result = await loginUseCase.call(body);
    expect(result, mockedResult);
    verify(authRepo.login(body)).called(1);
  });
}