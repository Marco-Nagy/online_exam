import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/questions/data/models/offline/checked_exam_table_model.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class IsarModule {
  @preResolve
  Future<Isar> get isarProvider async =>
      Isar.open([CheckedExamTableModelSchema], directory: getIt<Directory>().path);

  @preResolve
  Future<Directory> get directoryProvider async =>
      getApplicationSupportDirectory();
}
