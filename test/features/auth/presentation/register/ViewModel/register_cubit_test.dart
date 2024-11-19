import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/domain/use_cases/register_use_case.dart';
import 'package:online_exam/features/auth/presentation/register/ViewModel/register_cubit.dart';
import 'register_cubit_test.mocks.dart';
@GenerateMocks([RegisterUseCase])
void main() {
 late RegisterUseCase registerUseCase;
 late var registerBody;
 late RegisterCubit registerCubit;
 setUp(()
 {
   registerUseCase = MockRegisterUseCase();
   registerBody = RegisterRequest();
   registerCubit = RegisterCubit(registerUseCase);
 });
  blocTest<RegisterCubit,RegisterState>('when call doAction function it should call signUp from useCase and change '
      'state with the right sequence',
    build: () {
      var mockedResult =
      Success<User>(User());
      provideDummy<DataResult<User>>(mockedResult);
      when(registerUseCase.call(registerBody)).thenAnswer(
            (_) async => mockedResult,
      );
      return registerCubit;
    },
    act: (registerCubit) {
    registerCubit.doAction(RegisterAction(registerBody));
    },
    expect: () {
    verify(registerUseCase.call(registerBody)).called(1);
    return [
    isA<RegisterLoading>(),
    isA<RegisterSuccess>(),
    ];
    },
  );

 blocTest<RegisterCubit, RegisterState>(
   'when call doAction function  returns fail  it should emit Error state ',
   build: () {
     var mockedResult =
     Fail<User>(Exception());
     provideDummy<DataResult<User>>(mockedResult);
     when(registerUseCase.call(registerBody)).thenAnswer(
           (_) async => mockedResult,
     );
     return registerCubit;
   },
   act: (registerCubit) {
     registerCubit.doAction(RegisterAction(registerBody));
   },
   expect: () {
     verify(registerUseCase.call(registerBody)).called(1);
     return [
       isA<RegisterLoading>(),
       isA<RegisterError>(),
     ];
   },
 );

}
