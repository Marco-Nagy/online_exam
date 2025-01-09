import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/data/data_sources/offline/exam_offline_database.dart';
import 'package:online_exam/features/questions/data/data_sources/offline/questions_offline_datasource.dart';
import 'package:online_exam/features/questions/data/models/offline/checked_exam_table_model.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';

@Injectable(as: QuestionsOfflineDatasource)
class QuestionOfflineDatasourceImpl implements QuestionsOfflineDatasource {
  final ExamOfflineDatabase _offlineDatasource;

  QuestionOfflineDatasourceImpl(this._offlineDatasource);

  @override
  Future<DataResult<void>> addExam(CheckedExam exam) {
    return executeApi(
      () {
        return _offlineDatasource.addExam(CheckedExamTableModel.fromModel(exam));
      },
    );
  }

  @override
  Future<DataResult<List<CheckedExam>>> getExam() async {
    return await  executeApi(
      () async {
        var response = await _offlineDatasource.getExams();
        return response
            .map(
              (e) => e.toModel(),
            )
            .toList();
      },
    );
  }
}
