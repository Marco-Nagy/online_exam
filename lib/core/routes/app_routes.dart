import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/base_routes.dart';
import 'package:online_exam/core/utils/screens/under_build_screen.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/auth/presentation/forget_password/screens/email_verification.dart';
import 'package:online_exam/features/auth/presentation/forget_password/screens/forget_password.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_view_model.dart';
import 'package:online_exam/features/auth/presentation/login/screens/login_screen.dart';
import 'package:online_exam/features/auth/presentation/register/ViewModel/register_cubit.dart';
import 'package:online_exam/features/auth/presentation/register/screens/register_screen.dart';

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
