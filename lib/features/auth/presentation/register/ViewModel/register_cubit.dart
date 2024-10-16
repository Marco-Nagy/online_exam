import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/response/AuthResponse.dart';
import 'package:online_exam/features/auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  void doAction(RegisterAction action){
    switch(action) {
      case RegisterAction():_register(action);
    }
  }
  Future<void> _register(RegisterAction action) async {
    emit(RegisterLoading());
    var result = await registerUseCase(action.body);
    switch (result) {
      case Success<AuthResponse>():
        emit(RegisterSuccess(result.data));
      case Fail<AuthResponse>():
        emit(RegisterError(ErrorHandler.handle(result.exception!)));
    }
  }
}
