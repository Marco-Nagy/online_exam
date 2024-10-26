import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

class SubjectMapper {
  static List<Subject> toSubjectEntity(SubjectResponseModel subjectResponse) {
    if (subjectResponse.subjects == null) return [];
    return subjectResponse.subjects!
        .map(
          (e) => Subject(id: e!.id!, name: e.name!, icon: e.icon!),
        )
        .toList();
  }
}
