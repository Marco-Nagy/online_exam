import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';

sealed class QuestionBaseActions {
}
class GetQuestionsListByExamId implements QuestionBaseActions{
  final Exam exam;
  GetQuestionsListByExamId({required this.exam});

}

class SelectQuestionAction implements QuestionBaseActions {
  final CheckAnswers body;

  SelectQuestionAction({required this.body});
}

class SubmitFinishExamAction implements QuestionBaseActions {}

class StartExamActionAgain implements QuestionBaseActions{}
