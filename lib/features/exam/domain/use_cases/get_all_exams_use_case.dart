import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/exam/domain/repositories/exam_repo.dart';

@injectable
class GetAllExamsUseCase {
  final ExamRepo examRepo;

  GetAllExamsUseCase(this.examRepo);

  Future<DataResult<List<Exam>>> call(String subjectId)  {
    return  examRepo.getExamsBySubjectId(subjectId);
  }
}
