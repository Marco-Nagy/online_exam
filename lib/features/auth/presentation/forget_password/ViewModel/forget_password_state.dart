part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
/// ForgetPassword states
 class ForgetPasswordLoading extends ForgetPasswordState {}
 class ForgetPasswordSuccess extends ForgetPasswordState {
final  ForgotPasswordResponse response;
  ForgetPasswordSuccess(this.response);
}
 class ForgetPasswordFailed extends ForgetPasswordState {
final  ErrorModel errorModel;
  ForgetPasswordFailed(this.errorModel);
 }
/// Verify Code states
class VerifyResetCodeLoading extends ForgetPasswordState {}

class VerifyResetCodeSuccess extends ForgetPasswordState {
  final  VerifyResetCodeResponse response;
  VerifyResetCodeSuccess(this.response);
}

class VerifyResetCodeFailed extends ForgetPasswordState {
  final  ErrorModel errorModel;
  VerifyResetCodeFailed(this.errorModel);
}
/// Reset Password states
class ResetPasswordLoading extends ForgetPasswordState {}

class ResetPasswordSuccess extends ForgetPasswordState {
  AuthResponse authResponse;
  ResetPasswordSuccess(this.authResponse);
}

class ResetPasswordFailed extends ForgetPasswordState {
  final  ErrorModel errorModel;
  ResetPasswordFailed(this.errorModel);
}

sealed class ForgetPasswordScreenAction{}

class ForgetPasswordAction implements ForgetPasswordScreenAction {
 ForgetPasswordRequest body;
  ForgetPasswordAction(this.body);
}
class VerifyResetCodeAction implements ForgetPasswordScreenAction {
  VerifyResetCodeRequest body;
  VerifyResetCodeAction(this.body);
}
class ResetPasswordAction implements ForgetPasswordScreenAction {
  ResetPasswordRequest body;
  ResetPasswordAction(this.body);
}
