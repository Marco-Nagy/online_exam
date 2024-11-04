import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/reset_password_use_case.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test(
      'when call (call function) it should get auth repo.resetPassword with correct body',
      () async {
    var authRepo = MockAuthRepository();
    var resetPasswordUseCase = ResetPasswordUseCase(authRepo);
    var body = ResetPasswordRequest();
    var message = '';
    var token  = '';
    var id = '';
    var username = '';
    var firstName = '';
    var lastName = '';
    var email = '';
    var phone = '';
    var role = '';
    var isVerified = true;
    var createdAt = '';
    var user = UserModel(id, username, firstName, lastName, email, phone, role, isVerified, createdAt);
    var mockedResult = Success<AuthResponse>(AuthResponse(message,token,user));
    provideDummy<ApiResult<AuthResponse>>(mockedResult);
    when(authRepo.resetPassword(body)).thenAnswer((_) async =>mockedResult ,);
    var result = await resetPasswordUseCase.call(body);
    expect(result, mockedResult);
    verify(authRepo.resetPassword(body)).called(1);
  });
}
