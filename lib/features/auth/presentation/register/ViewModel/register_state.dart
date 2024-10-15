part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState{}
class RegisterSuccess extends RegisterState {
  final AuthResponse body ;

  RegisterSuccess(this.body);
}

class RegisterError extends RegisterState {
  final ErrorModel errorModel;
  RegisterError(this.errorModel);
}
sealed class RegisterScreenAction {}

class RegisterAction implements RegisterScreenAction {
  RegisterRequest body ;
  RegisterAction(this.body);
}