import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoginLoadingState extends LoginScreenState {}

class LoginErrorState extends LoginScreenState {
  ErrorModel errorModel;

  LoginErrorState(this.errorModel);
}

class LoginSuccessState extends LoginScreenState {
  User? user;

  LoginSuccessState(this.user);
}



class LoginRememberMeVisibility extends LoginScreenState {
  User? user;

  LoginRememberMeVisibility(this.user);
}

sealed class LoginScreenAction {}

class LoginAction extends LoginScreenAction {
  SignInRequest body;
  bool isRememberMeChecked;
  LoginAction(
    this.body,
      this.isRememberMeChecked,
  );
}
