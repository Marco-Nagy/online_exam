import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:dartz/dartz.dart';


abstract class SurveyRepository {
  Future<ApiResult<List<Subject>>> getSubjects();
}
