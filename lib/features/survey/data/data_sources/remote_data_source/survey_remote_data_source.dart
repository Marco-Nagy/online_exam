import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

abstract class SurveyRemoteDataSource{
  Future<ApiResult<List<Subject>>> getSubjects();
}