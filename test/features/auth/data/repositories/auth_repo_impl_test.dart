import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'auth_repo_impl_test.mocks.dart';
@GenerateMocks([AuthOnlineDatasource])
void main() {
  var authResponse = AuthResponse(
    'Hello',
    'dummyToken',
    UserModel(
      '1',
      'test@example.com',
      'testUser',
      'Test',
      'User',
      '1234567890',
      'student',
      true,
      '10:10',
    ),
  );
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
  var updatedUser = UserRequest(
      email: 'test@example.com',
      username: 'testUser',
      firstName: 'Test',
      lastName: 'User',
      phone: '1234567890',
     );
  group('test auth online data source when call authRepo.forgetPassword or authRepo.resetPassword or authRepo.verifyResetCode ', ()
    {
      test('when call authRepo.signUp it should call signUp function from auth online data source', () async{
        var onlineDatasource = MockAuthOnlineDatasource();
        var authOnlineDatasource = AuthRepoImpl(onlineDatasource);
        var body = RegisterRequest();
        var mockedResult = Success<User>(User());
        provideDummy<DataResult<User>>(mockedResult);
        when(onlineDatasource.signeUp(body)).thenAnswer((_) async => mockedResult ,);
        var result = await authOnlineDatasource.signeUp(body);
        expect(result, mockedResult);
        verify(onlineDatasource.signeUp(body)).called(1);
      });
      test('when call authRepo.login it should call login function from auth online data source', () async{
        var onlineDatasource = MockAuthOnlineDatasource();
        var authOnlineDatasource = AuthRepoImpl(onlineDatasource);
        var body = SignInRequest();
        var mockedResult = Success<User>(User());
        provideDummy<DataResult<User>>(mockedResult);
        when(onlineDatasource.login(body)).thenAnswer((_) async => mockedResult ,);
        var result = await authOnlineDatasource.login(body);
        expect(result, mockedResult);
        verify(onlineDatasource.login(body)).called(1);
      });
      test('when call authRepo.forget password it should call forget password function from auth online data source', () async{
        var onlineDatasource = MockAuthOnlineDatasource();
        var authOnlineDatasource = AuthRepoImpl(onlineDatasource);
        var body = ForgetPasswordRequest();
        var mockedResult = Success<ForgotPasswordResponse>(ForgotPasswordResponse());
        provideDummy<DataResult<ForgotPasswordResponse>>(mockedResult);
        when(onlineDatasource.forgotPassword(body)).thenAnswer((_) async => mockedResult ,);
        var result = await authOnlineDatasource.forgotPassword(body);
        expect(result, mockedResult);
        verify(onlineDatasource.forgotPassword(body)).called(1);
      });
    test('when call authRepo.resetPassword it should call resetPassword function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var body = ResetPasswordRequest();
      var mockedResult = Success<AuthResponse>(authResponse);
      provideDummy<DataResult<AuthResponse>>(mockedResult);
      when(onlineDatasource.resetPassword(body)).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.resetPassword(body);
      expect(result, mockedResult);
      verify(onlineDatasource.resetPassword(body)).called(1);
    });
    test('when call authRepo.verifyResetCode it should call verifyResetCode function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var body = VerifyResetCodeRequest();
      var mockedResult = Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
      provideDummy<DataResult<VerifyResetCodeResponse>>(mockedResult);
      when(onlineDatasource.verifyResetCode(body)).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.verifyResetCode(body);
      expect(result, mockedResult);
      verify(onlineDatasource.verifyResetCode(body)).called(1);
    });
    test('when call authRepo.getProfileData it should call getProfileData function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var mockedResult = Success<User>(user);
      provideDummy<DataResult<User>>(mockedResult);
      when(onlineDatasource.getProfileData()).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.getProfileData();
      expect(result, mockedResult);
      verify(onlineDatasource.getProfileData()).called(1);
    });
    test('when call authRepo.editProfile it should call editProfileData function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var mockedResult = Success<User>(user);
      provideDummy<DataResult<User>>(mockedResult);
      when(onlineDatasource.editProfile(updatedUser)).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.editProfile(updatedUser);
      expect(result, mockedResult);
      verify(onlineDatasource.editProfile(updatedUser)).called(1);
    });
    test('when call authRepo.changePassword it should call changePassword function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var mockedResult = Success<User>(user);
      var body = ChangePasswordRequest(
        'test@example.com',
        'testUser',
        'testUser',
      );

      provideDummy<DataResult<User>>(mockedResult);
      when(onlineDatasource.changePassword(body)).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.changePassword(body);
      expect(result, mockedResult);
      verify(onlineDatasource.changePassword(body)).called(1);
    });
    }
  );
}