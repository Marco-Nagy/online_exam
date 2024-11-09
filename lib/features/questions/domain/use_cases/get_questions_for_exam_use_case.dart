import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/repositories/questions_repo.dart';

@injectable
class GetQuestionsForExamUseCase {
final  QuestionsRepo questionsRepo;
  GetQuestionsForExamUseCase(this.questionsRepo);

  Future<ApiResult<List<Question>>> call(String examId)  {
    return  questionsRepo.getQuestionsByExamId(examId);
  }
}
