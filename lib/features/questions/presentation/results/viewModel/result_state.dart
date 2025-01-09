part of 'result_cubit.dart';

sealed class ResultState extends Equatable {}

class ResultInitial extends ResultState {
  @override
  List<Object?> get props => [];
}

class ResultLoadingState extends ResultState {
  @override
  List<Object?> get props => [];
}

class GetSubmittedExamsListSuccessState extends ResultState {
  final List<CheckedExam> examsList;

  GetSubmittedExamsListSuccessState(this.examsList);

  @override
  List<Object?> get props => [examsList];
}
class GetExamsAnswersSuccessState extends ResultState {
  final CheckedExam exam;

  GetExamsAnswersSuccessState(this.exam);

  @override
  List<Object?> get props => [exam];
}


class ResultErrorState extends ResultState {
  final String error;

  ResultErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
