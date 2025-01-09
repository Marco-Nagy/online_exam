import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/data/data_sources/offline/questions_offline_datasource.dart';
import 'package:online_exam/features/questions/data/data_sources/online/questions_oline_data_source.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/repositories/questions_repo.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsOlineDataSource questionsOlineDataSource;
  final QuestionsOfflineDatasource questionsOfflineDataSource;

  QuestionsRepoImpl(this.questionsOlineDataSource, this.questionsOfflineDataSource);

  @override
  Future<DataResult<List<Question>>> getQuestionsByExamId(String examId) {
    return questionsOlineDataSource.getQuestionsByExamId(examId);
  }

  @override
  Future<DataResult<void>> addExam(CheckedExam exam) {
   return questionsOfflineDataSource.addExam(exam);
  }

  @override
  Future<DataResult<List<CheckedExam>>> getSubmittedExams() {
    return questionsOfflineDataSource.getExam();
  }
}
