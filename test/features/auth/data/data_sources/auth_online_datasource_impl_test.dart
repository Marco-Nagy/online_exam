import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_online_datasource_impl.dart';
import 'package:online_exam/features/auth/data/mappers/auth_mappers.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

import 'auth_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late AuthOnlineDatasourceImpl authOnlineDatasource;
  setUp(
    () async {
      mockApiManager = MockApiManager();
      authOnlineDatasource = AuthOnlineDatasourceImpl(mockApiManager);
    },
  );

  group(
    'when call get user profile data to edit profile should call getProfile data from api manager',
    () {

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
            ApiResult<User> result = await authOnlineDatasource.changePassword(body);
            // Assert
            expect(result, isA<Success<User>>());
            expect(result is Success<User>, true);
            verify(mockApiManager.changePassword(body)).called(1);
          });
    },
  );
}
