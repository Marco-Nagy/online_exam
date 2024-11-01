import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'forgot_password_use_case_test.mocks.dart';


@GenerateMocks([AuthRepository])
void main() {
  test('when call (call method) it should get authRepository.forgotPassword with correct parameters', () async{
  var authRepo = MockAuthRepository();
  var forgetPasswordUseCase = ForgotPasswordUseCase(authRepo);
  var body = ForgetPasswordRequest() ;
  var mockedResult = Success<ForgotPasswordResponse>(ForgotPasswordResponse());
  provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
   when(authRepo.forgotPassword(body)).thenAnswer((_) async => mockedResult  ,);
   var result = await forgetPasswordUseCase.call(body);
    expect(result, mockedResult);
   verify(authRepo.forgotPassword(body)).called(1);
  });
}