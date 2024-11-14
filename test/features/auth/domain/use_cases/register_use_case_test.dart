import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/register_use_case.dart';
import 'change_password_use_case_test.mocks.dart';
@GenerateMocks([AuthRepository])
void main() {
  test('when call (call method) it should get authRepository.signUp with correct parameters', () async{
    var authRepo = MockAuthRepository();
    var registerUseCase = RegisterUseCase(authRepo);
    var body = RegisterRequest();
    var mockedResult = Success<User>(User());
    provideDummy<ApiResult<User>>(mockedResult);
    when(authRepo.signeUp(body)).thenAnswer((_) async => mockedResult,);
    var result = await registerUseCase.call(body);
    expect(result, mockedResult);
    verify(authRepo.signeUp(body)).called(1);
  });
}