import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:online_exam/features/survey/domain/repositories/survey_repositories.dart';

@injectable
class GetSubjectsUseCase {
  final SurveyRepository _repository;

  GetSubjectsUseCase(this._repository);

  Future<DataResult<List<Subject>>> call() => _repository.getSubjects();
}
