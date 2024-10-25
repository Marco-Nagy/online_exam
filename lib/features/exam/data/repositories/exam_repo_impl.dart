import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/exam/data/data_sources/exam_online_datasource.dart';
import 'package:online_exam/features/exam/data/models/response/exam_response_model.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/exam/domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamOnlineDatasource dataSource;

  ExamRepoImpl(this.dataSource);

  @override
  Future<ApiResult<List<Exam>>> getExamsBySubjectId(String subjectId)
 {
    return dataSource.getExamsBySubjectId(subjectId);
  }
}
