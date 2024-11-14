// question_states.dart
import 'package:equatable/equatable.dart';

abstract class QuestionState extends Equatable {
  @override
  List<Object?> get props => [
        RefreshState,
        GetQuestionLoading,
        GetQuestionSuccess,
        GetQuestionError,
        SelectQuestionAnswerState,
        CheckExamsLoadingState,
        CheckExamsSuccessState,
        CheckExamsErrorState,
      ];
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

class SelectQuestionAnswerState extends QuestionState {
  SelectQuestionAnswerState();

  @override
  List<Object?> get props => [];
}

class ExamTimeoutState extends QuestionState {}

class RefreshState extends QuestionState {}

class CheckExamsLoadingState extends QuestionState {}

class CheckExamsSuccessState extends QuestionState {}

class CheckExamsErrorState extends QuestionState {
  final Exception exception;
  CheckExamsErrorState(this.exception);
}

