import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/repositories/questions_repo.dart';
@injectable
class SubmitExamUseCase {
QuestionsRepo questionsRepo;

SubmitExamUseCase(this.questionsRepo);

Future<DataResult<void>> submitExam(CheckedExam exam) async {
  return await questionsRepo.addExam(exam);

}
}
