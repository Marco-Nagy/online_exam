import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_routes.dart';
import 'di/di.dart';

class OnlineExam extends StatelessWidget {
   OnlineExam({super.key});
   final GlobalKey<NavigatorState> navigatorKey = getIt<GlobalKey<NavigatorState>>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      ),
    );
  }
}
