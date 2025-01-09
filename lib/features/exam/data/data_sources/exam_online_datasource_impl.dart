import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api_execute.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/features/exam/data/data_sources/exam_online_datasource.dart';
import 'package:online_exam/features/exam/data/mappers/exam_mapper.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
@Injectable(as:ExamOnlineDatasource )
class ExamOnlineDatasourceImpl implements ExamOnlineDatasource{
final ApiManager apiManager;

ExamOnlineDatasourceImpl(this.apiManager);

  @override
  Future<DataResult<List<Exam>>> getExamsBySubjectId(String subjectId) {
    return executeApi(() async {
      var response= await apiManager.getExamsBySubjectId(subjectId);
      return   ExamMapper.toExamEntity(response );
    });
  }
}
