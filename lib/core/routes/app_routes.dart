import 'package:flutter/material.dart';
import 'package:online_exam/presentation/screens/email_verification.dart';
import 'package:online_exam/presentation/screens/forget_password.dart';


class AppRoutes {
  static const String forgetPassword = '/';
  static const String emailVerification = 'emailVerification';



  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (BuildContext context) =>  const ForgetPassword(),
        );
        case AppRoutes.emailVerification:
          return MaterialPageRoute(builder: (BuildContext context) =>   EmailVerification(),
        );
      default:
        return MaterialPageRoute(builder: (BuildContext context) =>  const SizedBox());
    }
  }
}
