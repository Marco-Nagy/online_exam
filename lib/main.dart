import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/online_exam.dart';

import 'core/Services/shared_preference/shared_preference_helper.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/abb_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPrefHelper().instantiatePreferences();
  Bloc.observer = MyBlocObserver();

  runApp(OnlineExam(),
  );
}
