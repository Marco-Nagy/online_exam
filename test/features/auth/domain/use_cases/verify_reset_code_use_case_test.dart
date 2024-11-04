import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:online_exam/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'verify_reset_code_use_case_test.mocks.dart';
@GenerateMocks([AuthRepository])
void main() {
  test('when call (call function) it should get auth repo.verifyResetCode with correct body', () async {
   var authRepo = MockAuthRepository();
   var verifyResetUseCase = VerifyResetCodeUseCase(authRepo);
   var mockedResult = Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
   provideDummy<ApiResult<VerifyResetCodeResponse>>(mockedResult);
   var body = VerifyResetCodeRequest();
   when(authRepo.verifyResetCode(body)).thenAnswer((_) async => mockedResult ,);
   var result = await verifyResetUseCase.call(body);
   expect(result, mockedResult);
   verify(authRepo.verifyResetCode(body)).called(1);
  });
}