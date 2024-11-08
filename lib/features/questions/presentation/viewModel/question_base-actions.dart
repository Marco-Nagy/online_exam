import 'package:flutter/cupertino.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

sealed class QuestionBaseActions {
}
class GetQuestionsListByExamId implements QuestionBaseActions{
  final Exam exam;
  GetQuestionsListByExamId({required this.exam});

}
class SubmitQuestionAction implements QuestionBaseActions{
  final CheckAnswers body;


  SubmitQuestionAction({  required this.body});
}



