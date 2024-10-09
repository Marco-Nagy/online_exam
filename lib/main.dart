import 'package:flutter/material.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/presentation/screens/forget_password.dart';

import 'core/routes/app_routes.dart';

void main() {
  configureDependencies();
  runApp(
    const MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    ),
  );
}
