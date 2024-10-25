part of 'exam_cubit.dart';

sealed class ExamState extends Equatable {
  const ExamState();
}

final class ExamInitial extends ExamState {
  @override
  List<Object> get props => [];
}

final class LoadingExams extends ExamState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SuccessExamList extends ExamState {
  final List<Exam> exams;
  const SuccessExamList({required this.exams });
  @override
  // TODO: implement props
  List<Object?> get props => [exams];
}

final class ErrorExams extends ExamState {
  final ErrorModel errorModel;
  const ErrorExams({required this.errorModel });

  @override
  // TODO: implement props
  List<Object?> get props =>[errorModel];

}
