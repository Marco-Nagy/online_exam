import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/domain/use_cases/login_use_case.dart';

import '../../login/ViewModel/login_contract.dart';
@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
  LoginViewModel(this.loginCase):super(InitialState());
  final LoginUseCase loginCase;

  void doAction(LoginScreenAction action){
    switch(action) {
      case LoginAction():_login(action);
    }
  }

  Future<void> _login(LoginAction action) async {
    emit(LoginLoadingState());
    var result = await loginCase(action.body);
    switch (result) {
      case Success<AuthResponse>():
        emit(LoginSuccessState(result.data));
      case Fail<AuthResponse>():
        emit(
          LoginErrorState(
            ErrorHandler.handle(result.exception!),
          ),
        );
    }
  }
}
