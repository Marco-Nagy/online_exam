import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam/features/questions/data/models/offline/checked_exam_table_model.dart';

@singleton
class ExamOfflineDatabase {
  Isar isar;

  ExamOfflineDatabase(this.isar);

  Future<void> addExam(CheckedExamTableModel exam) async {
    await isar.writeTxn(
      () async {
        await isar.checkedExamTableModels.put(exam);
      },
    );
  }

  Future<List<CheckedExamTableModel>> getExams() async {
    var response = await isar.writeTxn(
      () async {
        return await isar.checkedExamTableModels.where().findAll();
      },
    );
    return response;
  }
}
