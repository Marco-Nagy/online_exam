import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_constants.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error.dart';
import 'package:online_exam/features/auth/data/api/api_manager.dart';
import 'package:online_exam/features/survey/data/data_sources/remote_data_source/survey_remote_data_source.dart';
import 'package:online_exam/features/survey/data/mapper/subject_mapper.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

@LazySingleton(as: SurveyRemoteDataSource)
class SurveyApiRemoteDataSource implements SurveyRemoteDataSource {
  ApiManager apiManager;

  SurveyApiRemoteDataSource(this.apiManager);

  @override
  Future<ApiResult<List<Subject>>> getSubjects() {
    return executeApi(() async {
        var response = await apiManager.getSubjectList();
        return SubjectMapper.toSubjectEntity(response);
      },
    );
  }
}
