import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoginLoadingState extends LoginScreenState {}

class LoginErrorState extends LoginScreenState {
  ErrorModel errorModel;

  LoginErrorState(this.errorModel);
}

class LoginSuccessState extends LoginScreenState {
  AuthResponse? authResponse;

  LoginSuccessState(this.authResponse);
}



class LoginRememberMeVisibility extends LoginScreenState {
  AuthResponse authResponse;

  LoginRememberMeVisibility(this.authResponse);
}

sealed class LoginScreenAction {}

class LoginAction extends LoginScreenAction {
  SignInRequest body;
  LoginAction(
    this.body,
  );
}
