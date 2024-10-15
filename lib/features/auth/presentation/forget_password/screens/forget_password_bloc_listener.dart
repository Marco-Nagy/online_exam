import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/animated_status_dialog.dart';
import 'package:online_exam/features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if(state is ForgetPasswordLoading){
            AnimatedStatusDialog.show(status: Status.loading, message: '');
          }else if(state is ForgetPasswordSuccess){
            AnimatedStatusDialog.show(status: Status.success, message: state.response.info!);
            Future.delayed(const Duration(microseconds:1500 )).whenComplete(() {
              context.pop();
              context.pushReplacementNamed(AppRoutes.emailVerification);

            },);
          }else if(state is ForgetPasswordFailed){
            context.pop();
            AnimatedStatusDialog.show(status: Status.error, message: state.errorModel.message??'Error');
            Future.delayed(const Duration(seconds: 3)).then((value) {
              context.pop();
            },);
          }else
            if(state is VerifyResetCodeLoading){
            AnimatedStatusDialog.show(status: Status.loading, message: '');
          }else if(state is VerifyResetCodeSuccess){
            AnimatedStatusDialog.show(status: Status.success, message: state.response.status!);
            Future.delayed(const Duration(microseconds:1500 )).whenComplete(() {
              context.pop();
              context.pushReplacementNamed(AppRoutes.resetPassWord);

            },);
          }else if(state is VerifyResetCodeFailed){
            context.pop();
            AnimatedStatusDialog.show(status: Status.error, message: state.errorModel.message??'Error');
            Future.delayed(const Duration(seconds: 3)).then((value) {
              context.pop();
            },);
          }else if(state is ResetPasswordLoading){
              AnimatedStatusDialog.show(status: Status.loading, message: '');
            }else if(state is ResetPasswordSuccess){
              AnimatedStatusDialog.show(status: Status.success, message: state.authResponse.message!);
              Future.delayed(const Duration(microseconds:1500 )).whenComplete(() {
                context.pop();
                context.pushReplacementNamed(AppRoutes.home);

              },);
            }else if(state is ForgetPasswordFailed){
              context.pop();
              AnimatedStatusDialog.show(status: Status.error, message: state.errorModel.message??'Error');
              Future.delayed(const Duration(seconds: 3)).then((value) {
                context.pop();
              },);
            }
        },
        child: Container());
  }
}
