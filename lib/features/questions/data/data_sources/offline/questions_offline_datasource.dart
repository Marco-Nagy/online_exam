import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';

abstract class QuestionsOfflineDatasource {
Future<DataResult<void>> addExam(CheckedExam exam);
Future<DataResult<List<CheckedExam>>> getExam();
}
