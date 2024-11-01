import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:online_exam/features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart';

import 'forget_password_cubit_test.mocks.dart';

@GenerateMocks(
    [ForgotPasswordUseCase, VerifyResetCodeUseCase, ResetPasswordUseCase])
void main() {
  late ForgotPasswordUseCase forgetPasswordUseCase;
  late ForgetPasswordCubit forgetPasswordCubit;
  late var body;
  setUp(() {
    forgetPasswordUseCase = MockForgotPasswordUseCase();
    var verifyResetCodeUseCase = MockVerifyResetCodeUseCase();
    var resetPasswordUseCase = MockResetPasswordUseCase();
    body = ForgetPasswordRequest();
    forgetPasswordCubit = ForgetPasswordCubit(
        forgetPasswordUseCase, verifyResetCodeUseCase, resetPasswordUseCase);
  });
  blocTest<ForgetPasswordCubit, ForgetPasswordState>(
    'when call doAction function it should call forget password from useCase and change '
    'state with the right sequence',
    build: () {
      var mockedResult =
          Success<ForgotPasswordResponse>(ForgotPasswordResponse());
      provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
      when(forgetPasswordUseCase.call(body)).thenAnswer(
        (_) async => mockedResult,
      );
      return forgetPasswordCubit;
    },
    act: (forgetPasswordCubit) {
      forgetPasswordCubit.doAction(ForgetPasswordAction(body));
    },
    expect: () {
      verify(forgetPasswordUseCase.call(body)).called(1);
      return [
        isA<ForgetPasswordLoading>(),
        isA<ForgetPasswordSuccess>(),
      ];
    },
  );
  blocTest<ForgetPasswordCubit, ForgetPasswordState>(
    'when call doAction function  returns fail  it should emit Error state ',
    build: () {
      var mockedResult =
          Fail<ForgotPasswordResponse>(Exception());
      provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
      when(forgetPasswordUseCase.call(body)).thenAnswer(
        (_) async => mockedResult,
      );
      return forgetPasswordCubit;
    },
    act: (forgetPasswordCubit) {
      forgetPasswordCubit.doAction(ForgetPasswordAction(body));
    },
    expect: () {
      verify(forgetPasswordUseCase.call(body)).called(1);
      return [
        isA<ForgetPasswordLoading>(),
        isA<ForgetPasswordFailed>(),
      ];
    },
  );
}
