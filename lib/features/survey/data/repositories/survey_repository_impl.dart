import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error.dart';
import 'package:online_exam/core/networking/error/error.dart';
import 'package:online_exam/core/networking/error/failure.dart';
import 'package:online_exam/features/survey/data/data_sources/remote_data_source/survey_remote_data_source.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:online_exam/features/survey/domain/repositories/survey_repositories.dart';
import 'package:dartz/dartz.dart';


@LazySingleton(as: SurveyRepository)
class SurveyRepositoryIml implements SurveyRepository {
  final SurveyRemoteDataSource _remoteDataSource;

  SurveyRepositoryIml(this._remoteDataSource);

  @override
  Future<ApiResult<List<Subject>>> getSubjects() {
    return _remoteDataSource.getSubjects();
  }
}
