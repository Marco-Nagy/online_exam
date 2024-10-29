import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/data/data_sources/questions_oline_data_source.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/repositories/questions_repo.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsOlineDataSource questionsOlineDataSource;

  QuestionsRepoImpl(this.questionsOlineDataSource);

  @override
  Future<ApiResult<List<Question>>> getQuestionsByExamId(String examId) {
    return questionsOlineDataSource.getQuestionsByExamId(examId);
  }
}
