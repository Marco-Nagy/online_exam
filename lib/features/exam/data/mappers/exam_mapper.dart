import 'package:online_exam/features/exam/data/models/response/exam_response_model.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';

class ExamMapper {
  static List<Exam> toExamEntity(ExamResponseModel examsResponse) {
    if (examsResponse.exams == null) return [];
    return examsResponse.exams!
        .map(
          (exam) => Exam(
            id: exam!.id!,
            title: exam.title!,
            duration: exam.duration!,
            subject: exam.subject!,
            numberOfQuestions: exam.numberOfQuestions!,
            active: exam.active!,
          ),
        )
        .toList();
  }
}
