import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam/features/survey/data/mapper/subject_mapper.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

void main() {
  group('SubjectMapper', () {
    test('should return a list of Subject entities when subjects are provided',
        () {
      // Arrange
      final sampleJson = {
        "message": "Success",
        "metadata": {"currentPage": 1, "numberOfPages": 5, "limit": 20},
        "subjects": [
          {
            "_id": "123",
            "name": "Mathematics",
            "icon": "math_icon.png",
            "createdAt": "2024"
          },
          {
            "_id": "124",
            "name": "Science",
            "icon": "science_icon.png",
            "createdAt": "2023"
          }
        ]
      };

      final subjectResponse = SubjectResponseModel.fromJson(sampleJson);

      final subjects = SubjectMapper.toSubjectEntity(subjectResponse);

      expect(subjects, isA<List<Subject>>());
      expect(subjects.length, 2);
      expect(subjects[0].id, "123");
      expect(subjects[0].name, "Mathematics");
      expect(subjects[0].icon, "math_icon.png");
      expect(subjects[1].id, "124");
      expect(subjects[1].name, "Science");
      expect(subjects[1].icon, "science_icon.png");
    });

    test('should return an empty list when subjects are null', () {
      final subjectResponse = SubjectResponseModel("No subjects", null, null);

      final subjects = SubjectMapper.toSubjectEntity(subjectResponse);

      expect(subjects, isEmpty);
    });

    test('should handle empty subject list correctly', () {
      final subjectResponse = SubjectResponseModel("Empty subjects", null, []);

      final subjects = SubjectMapper.toSubjectEntity(subjectResponse);

      expect(subjects, isEmpty);
    });
  });
}
