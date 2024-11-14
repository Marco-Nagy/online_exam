import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource_impl.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'auth_online_datasource_impl_test.mocks.dart';
import 'package:online_exam/features/auth/data/mappers/auth_mappers.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late AuthOnlineDatasource authOnlineDatasource;
  var bodyForgetPassword = ForgetPasswordRequest();
  var bodyResetPassword = ResetPasswordRequest();
  var bodyVerifyResetCode = VerifyResetCodeRequest();
  var registerBody = RegisterRequest();
  var loginBody = SignInRequest();
  var message = '';
  var token = '';
  var user = UserModel('1', 'Somaya', 'mahmoud', "last", 'somaya@gmail.com',
      "01060256698", 'user', true, '6/11/2024');
  setUp(() async {
    mockApiManager = MockApiManager();
    authOnlineDatasource = AuthOnlineDatasourceImpl(mockApiManager);
  });
  group(
    'when call signUp or login or forgetPassword or verifyResetCode  editProfile or getProfileData and changePassword should get them from api manager',
    () {
      // test signUp
      test(
          'when call signUp from online data source it should call apiManage.signUp with correct body',
          () async {
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

        User expectedUser = AuthMappers.toUserEntity(authResponse);
        var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(mockApiManager);
        var mockedResult = Success<User>(expectedUser);
        provideDummy<ApiResult<User>>(mockedResult);
        when(mockApiManager.signUp(registerBody)).thenAnswer(
          (_) async => authResponse,
        );
        var result = await authOnlineDataSourceImpl.signeUp(registerBody);
        expect(result, isA<Success<User>>());
        verify(mockApiManager.signUp(registerBody)).called(1);
      });
      // test signIn
      test(
          'when call login from online data source it should call apiManage.login with correct body',
          () async {
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

        User expectedUser = AuthMappers.toUserEntity(authResponse);
        var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(mockApiManager);
        var mockedResult = Success<User>(expectedUser);
        provideDummy<ApiResult<User>>(mockedResult);
        when(mockApiManager.signIn(loginBody)).thenAnswer(
          (_) async => authResponse,
        );
        var result = await authOnlineDataSourceImpl.login(loginBody);
        expect(result, isA<Success<User>>());
        verify(mockApiManager.signIn(loginBody)).called(1);
      });
      // test forgetPassword
      test(
          'when call forget password from online data source it should call apiManage.forgetPassword with correct body',
          () async {
        var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(mockApiManager);
        var mockedResult =
            Success<ForgotPasswordResponse>(ForgotPasswordResponse());
        provideDummy<ApiResult<ForgotPasswordResponse>>(mockedResult);
        when(mockApiManager.forgotPassword(bodyForgetPassword)).thenAnswer(
          (_) async => mockedResult.data,
        );
        var result =
            await authOnlineDataSourceImpl.forgotPassword(bodyForgetPassword);
        expect(result, isA<Success<ForgotPasswordResponse>>());
        verify(mockApiManager.forgotPassword(bodyForgetPassword)).called(1);
      });
      // test verifyResetCode
      test(
          'when call verify reset code  from online data source it should call apiManage.verifyResetCode with correct body',
          () async {
        var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(mockApiManager);
        var mockedResult =
            Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
        provideDummy<ApiResult<VerifyResetCodeResponse>>(mockedResult);
        when(mockApiManager.verifyResetCode(bodyVerifyResetCode)).thenAnswer(
          (_) async => mockedResult.data,
        );
        var result =
            await authOnlineDataSourceImpl.verifyResetCode(bodyVerifyResetCode);
        expect(result, isA<Success<VerifyResetCodeResponse>>());
        verify(mockApiManager.verifyResetCode(bodyVerifyResetCode)).called(1);
      });
      // test resetPassword
      test(
          'when call reset password from online data source it should call apiManage.resetPassword with correct body',
          () async {
        var authOnlineDataSourceImpl = AuthOnlineDatasourceImpl(mockApiManager);
        var mockedResult =
            Success<AuthResponse>(AuthResponse(message, token, user));
        provideDummy<ApiResult<AuthResponse>>(mockedResult);
        when(mockApiManager.resetPassword(bodyResetPassword)).thenAnswer(
          (_) async => mockedResult.data,
        );
        var result =
            await authOnlineDataSourceImpl.resetPassword(bodyResetPassword);
        expect(result, isA<Success<AuthResponse>>());
        verify(mockApiManager.resetPassword(bodyResetPassword)).called(1);
      });
      // test getUserProfileData **
      test(
          'when call get user profile data to edit profile should call getProfile data from api manager',
          () async {
        // Arrange
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

        User expectedUser = AuthMappers.toUserEntity(authResponse);
        Success<User> mockResult = Success<User>(expectedUser);
        provideDummy<ApiResult<User>>(mockResult);
        when(mockApiManager.getProfileData())
            .thenAnswer((_) async => authResponse);

        // Act
        ApiResult<User> result = await authOnlineDatasource.getProfileData();

        // Assert
        expect(result, isA<Success<User>>());
        expect(result is Success<User>, true);
        // expect(result, mockResult);
        verify(mockApiManager.getProfileData()).called(1);
      });
      // test editProfile **
      test(
          'when call edit profile post function to update profile should call editProfile from api manager',
          () async {
        // Arrange
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
        var body = User(
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

        User expectedUser = AuthMappers.toUserEntity(authResponse);
        Success<User> mockResult = Success<User>(expectedUser);
        provideDummy<ApiResult<User>>(mockResult);
        when(mockApiManager.editProfile(updatedUser))
            .thenAnswer((_) async => authResponse);

        // Act
        ApiResult<User> result = await authOnlineDatasource.editProfile(updatedUser);
        // Assert
        expect(result, isA<Success<User>>());
        // expect(result is Success<User>, true);
        // expect(result, mockResult);
        verify(mockApiManager.editProfile(updatedUser)).called(1);
      });
      // test changePassword **
      test(
          'when call change Password patch function to change password should call changePassword from api manager',
          () async {
        // Arrange
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
        var body = ChangePasswordRequest(
          'test@example.com',
          'testUser',
          'testUser',
        );

        User expectedUser = AuthMappers.toUserEntity(authResponse);
        Success<User> mockResult = Success<User>(expectedUser);
        provideDummy<ApiResult<User>>(mockResult);
        when(mockApiManager.changePassword(body))
            .thenAnswer((_) async => authResponse);

        // Act
        ApiResult<User> result =
            await authOnlineDatasource.changePassword(body);
        // Assert
        expect(result, isA<Success<User>>());
        expect(result is Success<User>, true);
        verify(mockApiManager.changePassword(body)).called(1);
      });
    },
  );
}
