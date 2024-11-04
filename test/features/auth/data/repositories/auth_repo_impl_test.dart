import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/data/repositories/auth_repo_impl.dart';
import 'auth_repo_impl_test.mocks.dart';
@GenerateMocks([AuthOnlineDatasource])
void main() {
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
  group('test auth online data source when call authRepo.forgetPassword or authRepo.resetPassword or authRepo.verifyResetCode ', ()
    {
      test('when call authRepo.forget password it should call forget password function from auth online data source', () async{
        var onlineDatasource = MockAuthOnlineDatasource();
        var authOnlineDatasource = AuthRepoImpl(onlineDatasource);
        var body = ForgetPasswordRequest();
        var mockedResult = Success<ForgotPasswordResponse>(ForgotPasswordResponse());
        provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
        when(onlineDatasource.forgotPassword(body)).thenAnswer((_) async => mockedResult ,);
        var result = await authOnlineDatasource.forgotPassword(body);
        expect(result, mockedResult);
        verify(onlineDatasource.forgotPassword(body)).called(1);
      });
    test('when call authRepo.resetPassword it should call resetPassword function from auth online data source', () async{
      var onlineDatasource = MockAuthOnlineDatasource();
      var authRepoImpl = AuthRepoImpl(onlineDatasource);
      var body = ResetPasswordRequest();
      var mockedResult = Success<AuthResponse>(AuthResponse(message,token,user));
      provideDummy<ApiResult<AuthResponse>>(mockedResult);
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
      provideDummy<ApiResult<VerifyResetCodeResponse>>(mockedResult);
      when(onlineDatasource.verifyResetCode(body)).thenAnswer((_) async => mockedResult ,);
      var result = await authRepoImpl.verifyResetCode(body);
      expect(result, mockedResult);
      verify(onlineDatasource.verifyResetCode(body)).called(1);
    });
    }
  );
}