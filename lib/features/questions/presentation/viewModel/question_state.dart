// question_states.dart
import 'package:equatable/equatable.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';

abstract class QuestionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class GetQuestionLoading extends QuestionState {}

class GetQuestionSuccess extends QuestionState {


  GetQuestionSuccess();

  @override
  List<Object?> get props => [];
}

class GetQuestionError extends QuestionState {
  final String errorMessage;

  GetQuestionError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class SubmitQuestionState extends QuestionState {
  final QuestionCheckRequest checkRequest;
  SubmitQuestionState(this.checkRequest, );

  @override
  List<Object?> get props => [checkRequest];


}
class TimerState extends QuestionState {
  final int timeRemaining;
  TimerState(this.timeRemaining);

  @override
  List<Object?> get props => [timeRemaining];


}
class ExamTimeoutState extends QuestionState {}

class RefreshState extends QuestionState {}

