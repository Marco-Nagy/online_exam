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
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_contract.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_view_model.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: const CustomAppBar(title: 'Login'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }

}
