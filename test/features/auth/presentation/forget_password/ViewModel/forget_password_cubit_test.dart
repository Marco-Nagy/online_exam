import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
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
  late VerifyResetCodeUseCase verifyResetCodeUseCase;
  late ResetPasswordUseCase resetPasswordUseCase;
  late var bodyForgetPassword;
  late var bodyResetPassword;
  late var bodyVerifyResetCode;
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

  group('test forget password cubit with all functions inside as ( forget password, reset password'
      'and verify reset code', (){
    setUp(() {
      forgetPasswordUseCase = MockForgotPasswordUseCase();
      verifyResetCodeUseCase = MockVerifyResetCodeUseCase();
      resetPasswordUseCase = MockResetPasswordUseCase();
      bodyForgetPassword = ForgetPasswordRequest();
      bodyVerifyResetCode = VerifyResetCodeRequest();
      bodyResetPassword = ResetPasswordRequest();
      forgetPasswordCubit = ForgetPasswordCubit(
          forgetPasswordUseCase, verifyResetCodeUseCase, resetPasswordUseCase);
    });

    // test for forget password

    // 1 - test for forget password success

    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function it should call forget password from useCase and change '
          'state with the right sequence',
      build: () {
        var mockedResult =
        Success<ForgotPasswordResponse>(ForgotPasswordResponse());
        provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
        when(forgetPasswordUseCase.call(bodyForgetPassword)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(ForgetPasswordAction(bodyForgetPassword));
      },
      expect: () {
        verify(forgetPasswordUseCase.call(bodyForgetPassword)).called(1);
        return [
          isA<ForgetPasswordLoading>(),
          isA<ForgetPasswordSuccess>(),
        ];
      },
    );
    // 2 - test for forget password fail

    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function  returns fail  it should emit Error state ',
      build: () {
        var mockedResult =
        Fail<ForgotPasswordResponse>(Exception());
        provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
        when(forgetPasswordUseCase.call(bodyForgetPassword)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(ForgetPasswordAction(bodyForgetPassword));
      },
      expect: () {
        verify(forgetPasswordUseCase.call(bodyForgetPassword)).called(1);
        return [
          isA<ForgetPasswordLoading>(),
          isA<ForgetPasswordFailed>(),
        ];
      },
    );
    // test for verify reset code

    // 1 - test for verifyResetCode success
    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function it should call verify reset code from useCase and change '
          'state with the right sequence',
      build: () {
        var mockedResult =
        Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
        provideDummy<ApiResult<VerifyResetCodeResponse>>(mockedResult);
        when(verifyResetCodeUseCase.call(bodyVerifyResetCode)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(VerifyResetCodeAction(bodyVerifyResetCode));
      },
      expect: () {
        verify(verifyResetCodeUseCase.call(bodyVerifyResetCode)).called(1);
        return [
          isA<VerifyResetCodeLoading>(),
          isA<VerifyResetCodeSuccess>(),
        ];
      },
    );
    // 2- test for verifyResetCode fail
    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function  returns fail  it should emit Error state ',
      build: () {
        var mockedResult =
        Fail<VerifyResetCodeResponse>(Exception());
        provideDummy<ApiResult<VerifyResetCodeResponse>>(mockedResult);
        when(verifyResetCodeUseCase.call(bodyVerifyResetCode)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(VerifyResetCodeAction(bodyVerifyResetCode));
      },
      expect: () {
        verify(verifyResetCodeUseCase.call(bodyVerifyResetCode)).called(1);
        return [
          isA<VerifyResetCodeLoading>(),
          isA<VerifyResetCodeFailed>(),
        ];
      },
    );
    // test for reset password code

    // 1 - test for reset password success
    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function it should call reset password from useCase and change '
          'state with the right sequence',
      build: () {
        var mockedResult =
        Success<AuthResponse>(AuthResponse(message,token,user));
        provideDummy<ApiResult<AuthResponse>>(mockedResult);
        when(resetPasswordUseCase.call(bodyResetPassword)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(ResetPasswordAction(bodyResetPassword));
      },
      expect: () {
        verify(resetPasswordUseCase.call(bodyResetPassword)).called(1);
        return [
          isA<ResetPasswordLoading>(),
          isA<ResetPasswordSuccess>(),
        ];
      },
    );
    // 2- test for reset password fail
    blocTest<ForgetPasswordCubit, ForgetPasswordState>(
      'when call doAction function  returns fail  it should emit Error state ',
      build: () {
        var mockedResult =
        Fail<AuthResponse>(Exception());
        provideDummy<ApiResult<AuthResponse>>(mockedResult);
        when(resetPasswordUseCase.call(bodyResetPassword)).thenAnswer(
              (_) async => mockedResult,
        );
        return forgetPasswordCubit;
      },
      act: (forgetPasswordCubit) {
        forgetPasswordCubit.doAction(ResetPasswordAction(bodyResetPassword));
      },
      expect: () {
        verify(resetPasswordUseCase.call(bodyResetPassword)).called(1);
        return [
          isA<ResetPasswordLoading>(),
          isA<ResetPasswordFailed>(),
        ];
      },
    );

  });

}
