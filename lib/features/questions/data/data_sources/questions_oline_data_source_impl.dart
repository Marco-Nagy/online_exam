import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/data/data_sources/questions_oline_data_source.dart';
import 'package:online_exam/features/questions/data/mappers/question_mapper.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

@Injectable(as: QuestionsOlineDataSource)
class QuestionsOlineDataSourceImpl extends QuestionsOlineDataSource {
  final ApiManager apiManager;

  QuestionsOlineDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Question>>> getQuestionsByExamId(String examId) {
    return executeApi(
      () async {
        var response = await apiManager.getQuestionsByExamId(examId);
        return QuestionMapper.toQuestionEntity(response);
      },
    );
  }
}
