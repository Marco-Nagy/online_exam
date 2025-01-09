import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';

sealed class ResultBaseAction {
}
class GetSubmittedExamsList extends ResultBaseAction {}
class GetExamResults extends ResultBaseAction {
  final CheckedExam exam;
  GetExamResults(this.exam);
}
