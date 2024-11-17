import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';

abstract class ExamOnlineDatasource {
  Future<DataResult<List<Exam>>> getExamsBySubjectId(String subjectId);
}
