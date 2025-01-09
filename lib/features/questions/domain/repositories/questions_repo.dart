import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

abstract class QuestionsRepo {
  Future<DataResult<List<Question>>> getQuestionsByExamId(String examId);
  Future<DataResult<void>> addExam(CheckedExam exam);
  Future<DataResult<List<CheckedExam>>> getSubmittedExams();


}
