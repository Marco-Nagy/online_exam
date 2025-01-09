import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';

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
