import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/use_cases/get_questions_for_exam_use_case.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';
@injectable
class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.getQuestionsForExam) : super(QuestionInitial());

  final GetQuestionsForExamUseCase getQuestionsForExam;
  final List<CheckAnswers> _answers = [];
  List<String?> selectedAnswers = [];
  int questionIndex = 0;

  Timer? _timer;


  QuestionCheckRequest? questionCheckRequest;
  ValueNotifier<bool> selected = ValueNotifier(false);


  void doActions(QuestionBaseActions action) {
    switch (action) {
      case GetQuestionsListByExamId():
        _getQuestions(action);
      case SubmitQuestionAction():
        _submitQuestion(action);

    }
  }

  Future<void> _getQuestions(GetQuestionsListByExamId action) async {
    emit(GetQuestionLoading());

    var response = await getQuestionsForExam(action.exam.id);

    switch (response) {
      case Success<List<Question>>():

        emit(GetQuestionSuccess(response.data));

      case Fail():
        final errorMessage = ErrorHandler.handle(response.exception!).message;
        emit(GetQuestionError(errorMessage!));
    }
  }

  Future<void> _submitQuestion(SubmitQuestionAction action) async {
    if (action.body.correct!.isEmpty) {
      // Add the answer if it's correct and not empty
      _answers.add(action.body);
    } else {
      // Find the index of the answer with the same questionId
      int index = _answers.indexWhere(
          (element) => element.questionId == action.body.questionId);

      if (index != -1) {
        // If the questionId exists, update that element
        _answers[index] = action.body;
      } else {
        // If the questionId doesn't exist, add the new answer
        _answers.add(action.body);
      }
    }

    questionCheckRequest = QuestionCheckRequest(
      answers: _answers,
    );
    debugPrint('_answers  ${_answers.map(
      (e) => '${e.questionId} - ${e.correct}',
    )}');

    emit(SubmitQuestionState(questionCheckRequest!));
  }



}
