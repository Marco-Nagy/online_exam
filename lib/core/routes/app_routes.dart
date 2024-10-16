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
  static const String resetPassWord = 'resetPassWord';
  static const String home = '/home';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.login:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<LoginViewModel>(),
              child: const LoginScreen()),
        );
      case AppRoutes.register:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<RegisterCubit>(),
              child: const RegisterScreen()),
        );
      case AppRoutes.forgetPassword:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordCubit>(),
              child: ForgetPassword()),
        );
        case AppRoutes.emailVerification:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordCubit>(),
              child: EmailVerification()),
        );
      case AppRoutes.resetPassWord:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordCubit>(),
              child: ResetPassword()),
        );
      case AppRoutes.home:
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
