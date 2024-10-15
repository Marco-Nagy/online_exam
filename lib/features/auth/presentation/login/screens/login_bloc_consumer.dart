import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/animated_status_dialog.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_contract.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_view_model.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginScreenState>(
        listener: (context, state) {
          if(state is LoginLoadingState){
            AnimatedStatusDialog.show(status: Status.loading, message: '');
          }else if(state is LoginSuccessState){
            AnimatedStatusDialog.show(status: Status.success, message: 'Login success');
            Future.delayed(const Duration(microseconds:1500 )).whenComplete(() {
              context.pop();
              context.pushReplacementNamed(AppRoutes.home);

            },);
          }else if(state is LoginErrorState){
            context.pop();
            AnimatedStatusDialog.show(status: Status.error, message: state.errorModel.message??'Error');
            Future.delayed(const Duration(seconds: 3)).then((value) {
              context.pop();
            },);
          }else{
            AnimatedStatusDialog.show(status: Status.success, message: 'Failed to login');
          }
        },
        child: Container());
  }
}
