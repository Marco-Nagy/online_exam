import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/repositories/questions_repo.dart';

@injectable
class GetExamAnswersUseCase {
  final QuestionsRepo questionsRepo;

  GetExamAnswersUseCase(this.questionsRepo);

  Future<DataResult<List<CheckedExam>>>  call() async {
    var response =await  questionsRepo.getSubmittedExams();
    if (response is Success<List<CheckedExam>>) {
      return calculateCorrectAnswers(response.data);
    } else {
      return response;
    }


  }
  DataResult<List<CheckedExam>> calculateCorrectAnswers(List<CheckedExam> exams) {
    for (var exam in exams) {
      int correct = 0;

        for(int i=0; i<exam.checkedQuestions.length; i++){
          if(exam.checkedQuestions[i].correct == exam.checkAnswers[i].correct){
            correct++;
          }
      }
      exam.correctAnswers = correct;
    }

    return Success(exams);
  }
}
