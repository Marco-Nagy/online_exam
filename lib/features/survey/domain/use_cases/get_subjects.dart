import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/failure.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:online_exam/features/survey/domain/repositories/survey_repositories.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetSubjectsUseCase {
  final SurveyRepository _repository;

  GetSubjectsUseCase(this._repository);

  Future<ApiResult<List<Subject>>> call() => _repository.getSubjects();
}
