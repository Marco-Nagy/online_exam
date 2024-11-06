import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/data/data_sources/remote_data_source/survey_remote_data_source.dart';
import 'package:online_exam/features/survey/data/repositories/survey_repository_impl.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

class MockSurveyRemoteDataSource extends Mock implements SurveyRemoteDataSource {}

void main() {
  late SurveyRepositoryIml repository;
  late MockSurveyRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockSurveyRemoteDataSource();
    repository = SurveyRepositoryIml(mockRemoteDataSource);
  });

  group('SurveyRepositoryIml', () {
    test('should return subjects when the remote data source call is successful', () async {
      final List<Subject> mockSubjects = [
        Subject(id: '1', name: 'Mathematics', icon: 'math_icon.png'),
        Subject(id: '2', name: 'Science', icon: 'science_icon.png'),
      ];

      when(mockRemoteDataSource.getSubjects())
          .thenAnswer((_) async => Success(mockSubjects));

      final result = await repository.getSubjects();

      expect(result, isA<Success<List<Subject>>>());
      if (result is Success<List<Subject>>) {
        expect(result.data, mockSubjects);
      } else {
        fail('Expected a Success response, but got Fail');
      }
    });

    test('should return an error when the remote data source call fails', () async {
      final error = Exception('Error occurred');

      when(mockRemoteDataSource.getSubjects())
          .thenAnswer((_) async => Fail(error));

      final result = await repository.getSubjects();

      expect(result, isA<Fail<List<Subject>>>());
      if (result is Fail<List<Subject>>) {
        expect(result.exception, error);
      } else {
        fail('Expected a Fail response, but got Success');
      }
    });
  });
}
