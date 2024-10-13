import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/base_routes.dart';
import 'package:online_exam/core/utils/screens/under_build_screen.dart';
import 'package:online_exam/features/auth/presentation/screens/forget_password/email_verification.dart';
import 'package:online_exam/features/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:online_exam/features/auth/presentation/screens/login/login_screen.dart';
import 'package:online_exam/features/auth/presentation/screens/register_screen.dart';


class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String home = '/home';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.login:
        return BaseRoute(
          page: const LoginScreen(),
        );
      case AppRoutes.register:
        return BaseRoute(
          page: const RegisterScreen(),
        );
      case AppRoutes.forgetPassword:
        return BaseRoute(
          page: const ForgetPassword(),
        );
        case AppRoutes.emailVerification:
        return BaseRoute(
          page: const EmailVerification(),
        );
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
