import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/verify_reset_code_use_case.dart';

part 'forget_password_state.dart';
@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this.forgotPasswordUseCase,
    this.verifyResetCodeUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgetPasswordInitial());
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  void doAction(ForgetPasswordScreenAction action) {
    switch (action) {
      case ForgetPasswordAction():
        _forgotPassword(action);
      case VerifyResetCodeAction():
        _verifyResetCode(action);
      case ResetPasswordAction():
        _resetPassword(action);
    }
  }

  Future<void> _forgotPassword(ForgetPasswordAction action) async {
    emit(ForgetPasswordLoading());
    var result = await forgotPasswordUseCase(action.body);
    switch (result) {
      case Success<ForgotPasswordResponse>():
        emit(ForgetPasswordSuccess(result.data));
      case Fail<ForgotPasswordResponse>():
        emit(ForgetPasswordFailed(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _verifyResetCode(VerifyResetCodeAction action) async {
    emit(VerifyResetCodeLoading());
    var result = await verifyResetCodeUseCase(action.body);
    switch (result) {
      case Success<VerifyResetCodeResponse>():
        emit(VerifyResetCodeSuccess(result.data));
      case Fail<VerifyResetCodeResponse>():
        emit(VerifyResetCodeFailed(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _resetPassword(ResetPasswordAction action) async {
    emit(ResetPasswordLoading());
    var result = await resetPasswordUseCase(action.body);
    switch (result) {
      case Success<AuthResponse>():
        emit(ResetPasswordSuccess(result.data));
      case Fail<AuthResponse>():
        emit(ResetPasswordFailed(ErrorHandler.handle(result.exception!)));
    }
  }
}
