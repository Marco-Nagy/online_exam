import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class GetSubjectLoading extends SubjectState {}

class GetSubjectSuccess extends SubjectState {
  final List<Subject> subject;

  GetSubjectSuccess(this.subject);
}

class GetSubjectError extends SubjectState {
  final ErrorModel errorModel;

  GetSubjectError(this.errorModel);
}
