import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/api/api_manager.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/data/data_sources/remote_data_source/survey_api_remote_data_source.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

import '../../../../auth/data/data_sources/auth_online_datasource_impl_test.mocks.dart';


@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late SurveyApiRemoteDataSource surveyApiRemoteDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    surveyApiRemoteDataSource = SurveyApiRemoteDataSource(mockApiManager);
  });

  group('SurveyApiRemoteDataSource', () {
    test('should return a list of subjects on a successful API call', () async {
      // Arrange
      final sampleJson = {
        "message": "Success",
        "metadata": {
          "currentPage": 1,
          "numberOfPages": 5,
          "limit": 20
        },
        "subjects": [
          {
            "_id": "123",
            "name": "Mathematics",
            "icon": "math_icon.png",
            "createdAt": "2024-01-01T00:00:00Z"
          },
          {
            "_id": "124",
            "name": "Science",
            "icon": "science_icon.png",
            "createdAt": "2024-01-02T00:00:00Z"
          }
        ]
      };

      final subjectResponseModel = SubjectResponseModel.fromJson(sampleJson);

      when(mockApiManager.getSubjectList())
          .thenAnswer((_) async => subjectResponseModel);

      final result = await surveyApiRemoteDataSource.getSubjects();

      expect(result, isA<Success<List<Subject>>>());
      final subjects = (result as Success<List<Subject>>).data;
      expect(subjects.length, 2);
      expect(subjects[0].id, "123");
      expect(subjects[0].name, "Mathematics");
      expect(subjects[1].id, "124");
      expect(subjects[1].name, "Science");
    });

    test('should return a Fail result on an API error', () async {
      when(mockApiManager.getSubjectList())
          .thenThrow(Exception("API error"));

      final result = await surveyApiRemoteDataSource.getSubjects();

      expect(result, isA<Fail<List<Subject>>>());
    });
  });
}
