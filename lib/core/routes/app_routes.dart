import 'package:flutter/material.dart';
import 'package:online_exam/presentation/screens/forget_password.dart';


class AppRoutes {
  static const String forgetPassword = '/';



  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (BuildContext context) =>  ForgetPassword(),
        );
      default:
        return MaterialPageRoute(builder: (BuildContext context) =>  ForgetPassword());
    }
  }
}
