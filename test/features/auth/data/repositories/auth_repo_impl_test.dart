import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/repositories/auth_repo_impl.dart';

import 'auth_repo_impl_test.mocks.dart';
@GenerateMocks([AuthOnlineDatasource])
void main() {
  test('when call authRepo forget password it should call forget password function from auth online data source', () async{
  var onlineDatasource = MockAuthOnlineDatasource();
  var authOnlineDatasource = AuthRepoImpl(onlineDatasource);
  var body = ForgetPasswordRequest();
  var mockedResult = Success<ForgotPasswordResponse>(ForgotPasswordResponse());
  provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
  when(authOnlineDatasource.forgotPassword(body)).thenAnswer((_) async => mockedResult ,);
  var result = await authOnlineDatasource.forgotPassword(body);
  expect(result, mockedResult);
  verify(authOnlineDatasource.forgotPassword(body)).called(1);
  });
}