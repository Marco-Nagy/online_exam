import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/animated_status_dialog.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/presentation/ViewModel/login/login_contract.dart';
import 'package:online_exam/features/auth/presentation/ViewModel/login/login_view_model.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          appBar: const CustomAppBar(title: 'Login'),
          body: BlocListener<LoginViewModel, LoginScreenState>(
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: LoginForm(formKey: formKey),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
