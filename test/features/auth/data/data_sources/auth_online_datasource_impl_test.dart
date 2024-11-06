import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource_impl.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'auth_online_datasource_impl_test.mocks.dart';
@GenerateMocks([ApiManager])
void main() {
  test('when call forget password from online data source it should call apiManage.forgetPassword with correct body', () async{
    var apiManager = MockApiManager();
    var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(apiManager);
    var body = ForgetPasswordRequest();
    var mockedResult = Success<ForgotPasswordResponse>(ForgotPasswordResponse());
    provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
    when(apiManager.forgotPassword(body)).thenAnswer((_) async =>mockedResult.data ,);
    var result = await authOnlineDataSourceImpl.forgotPassword(body);
    expect(result, mockedResult);
    verify(apiManager.forgotPassword(body)).called(1);
    
  });
}