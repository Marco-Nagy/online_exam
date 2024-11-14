import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/use_cases/get_questions_for_exam_use_case.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.getQuestionsForExam) : super(QuestionInitial());

  final GetQuestionsForExamUseCase getQuestionsForExam;
  late CheckedExam exam;

  final List<CheckAnswers> _answers = [];
  List<Question> questions = [];
  ValueNotifier<int> questionIndex = ValueNotifier(1);
  late ValueNotifier<String> timeMessage = ValueNotifier<String>("00:00");
  int questionCount = 0;
  int totalCorrectAnswers=0;
  int totalWrongAnswers = 0;
  double gradePercent = 0.0;
  int time = 0;
  Timer? _timer;


  ValueNotifier<bool> selected = ValueNotifier(false);


  void doActions(QuestionBaseActions action) {
    switch (action) {
      case GetQuestionsListByExamId():
        _getQuestions(action);
      case SelectQuestionAction():
        _selectQuestionAnswer(action);
      case SubmitFinishExamAction():
        _submitFinishExam();
      case StartExamActionAgain():
        _startAgain();
    }
  }

  Future<void> _getQuestions(GetQuestionsListByExamId action) async {
    emit(GetQuestionLoading());

    var response = await getQuestionsForExam(action.exam.id);

    switch (response) {
      case Success<List<Question>>():
        {
          questions = response.data;
          questionCount = questions.length;
          for (var i = 0; i < questions.length; i++) {
            _answers
                .add(CheckAnswers(questionId: questions[i].id, correct: ''));
          }
          time = exam.duration * 60;

          _timer = Timer.periodic(
            const Duration(seconds: 1),
            startCountdown,
          );

          emit(GetQuestionSuccess());
        }

      case Fail():
        final errorMessage = ErrorHandler.handle(response.exception!).message;
        emit(GetQuestionError(errorMessage!));
    }
  }

  Future<void> _selectQuestionAnswer(SelectQuestionAction action) async {
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
      isAnswerSelected;
      emit(RefreshState());
    }
    exam.checkAnswers = _answers;
    exam.checkedQuestions =questions;

    // questionCheckRequest
    // = QuestionCheckRequest(
    //   answers: _answers
    //       .where(
    //         (element) => element.correct != null,
    //       )
    //       .toList(),
    // );
    debugPrint('_answers  ${_answers.map(
      (e) => '${e.questionId} - ${e.correct}',
    )}');

    emit(SelectQuestionAnswerState());
  }


  _submitFinishExam(){
    emit(CheckExamsLoadingState());
    _calculateExamScore();
    emit(CheckExamsSuccessState());
  }

  void startCountdown(Timer timer) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        _updateTime();
      } else {
        _timer?.cancel();
        emit(ExamTimeoutState());
        // TimeOutDialog.show();
      }
    });
  }

  void _updateTime() {
    String minutes = (time ~/ 60).toString().padLeft(2, '0');
    String seconds = (time % 60).toString().padLeft(2, '0');
    timeMessage.value = '$minutes:$seconds';
  }

  bool isWarning() {
    return time >= (exam.duration * .22);
  }

  void goToNextQuestion(int totalQuestions) {
    if (questionIndex.value < totalQuestions - 1) {
      questionIndex.value++;
    }
  }

  void goToPreviousQuestion() {
    if (questionIndex.value - 1 > 0) {
      questionIndex.value--;
    }
  }

  isAnswerSelected(String key) {
    return (_answers[questionIndex.value - 1].correct == key);
  }
  _calculateExamScore(){
    int correctAnswers = 0;
    for(int i=0; i<questions.length; i++){
      if(_answers[i].correct == questions[i].correct){
        correctAnswers++;

    }

      totalCorrectAnswers = correctAnswers;
      totalWrongAnswers = questionCount - totalCorrectAnswers;
      gradePercent = (totalCorrectAnswers / questionCount) ;

    }


  }
  void _startAgain() {
    for (var i = 0; i < questions.length; i++) {
      _answers.clear();
      questionCount = questions.length;
      for (var i = 0; i < questions.length; i++) {
        _answers
            .add(CheckAnswers(questionId: questions[i].id, correct: ''));
      }
    }
    questionIndex.value = 1;
    time = exam.duration * 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      startCountdown,
    );

     emit(GetQuestionSuccess());
  }
}
