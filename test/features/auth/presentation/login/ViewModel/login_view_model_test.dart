import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/use_cases/login_use_case.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_contract.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_view_model.dart';

import 'login_view_model_test.mocks.dart';
@GenerateMocks([LoginUseCase])
void main() {
  late LoginUseCase loginUseCase;
  late SignInRequest loginBody;
  late LoginViewModel loginViewModel;
  setUp(() {
    loginUseCase = MockLoginUseCase();
    loginBody = SignInRequest();
    loginViewModel = LoginViewModel(loginUseCase);
  });

  blocTest<LoginViewModel, LoginScreenState>(
    'when call doAction function it should call login from useCase and change '
        'state with the right sequence',
    build: () {
      var mockedResult =
      Success<User>(User());
      provideDummy<DataResult<User>>(mockedResult);
      when(loginUseCase.call(loginBody)).thenAnswer(
            (_) async => mockedResult,
      );
      return loginViewModel;
    },
    act: (loginViewModel) {
      loginViewModel.doAction(LoginAction(loginBody,true));
    },
    expect: () {
      verify(loginUseCase.call(loginBody)).called(1);
      return [
        isA<LoginLoadingState>(),
        isA<LoginSuccessState>(),
      ];
    },
  );

  blocTest<LoginViewModel, LoginScreenState>(
    'when call doAction function  returns fail  it should emit Error state ',
    build: () {
      var mockedResult =
      Fail<User>(Exception());
      provideDummy<DataResult<User>>(mockedResult);
      when(loginUseCase.call(loginBody)).thenAnswer(
            (_) async => mockedResult,
      );
      return loginViewModel;
    },
    act: (loginViewModel) {
      loginViewModel.doAction(LoginAction(loginBody,true));
    },
    expect: () {
      verify(loginUseCase.call(loginBody)).called(1);
      return [
        isA<LoginLoadingState>(),
        isA<LoginErrorState>(),
      ];
    },
  );
}
