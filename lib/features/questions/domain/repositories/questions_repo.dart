import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

abstract class QuestionsRepo {
  Future<ApiResult<List<Question>>> getQuestionsByExamId(String examId);

}
