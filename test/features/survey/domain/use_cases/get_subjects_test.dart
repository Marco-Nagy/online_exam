import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:online_exam/features/survey/domain/repositories/survey_repositories.dart';
import 'package:online_exam/features/survey/domain/use_cases/get_subjects.dart';

// Mock class generated using Mockito
class MockSurveyRepository extends Mock implements SurveyRepository {}

void main() {
  late GetSubjectsUseCase getSubjectsUseCase;
  late MockSurveyRepository mockSurveyRepository;

  setUp(() {
    mockSurveyRepository = MockSurveyRepository();
    getSubjectsUseCase = GetSubjectsUseCase(mockSurveyRepository);
  });

  group('GetSubjectsUseCase', () {
    test('should return Success when repository call is successful', () async {
      // Arrange
      final List<Subject> mockSubjects = [
        Subject(id: '1', name: 'Mathematics', icon: 'math_icon.png'),
        Subject(id: '2', name: 'Science', icon: 'science_icon.png'),
      ];

      when(mockSurveyRepository.getSubjects())
          .thenAnswer((_) async => Success(mockSubjects));

      // Act
      final result = await getSubjectsUseCase.call();

      // Assert
      expect(result, isA<Success<List<Subject>>>());
      if (result is Success<List<Subject>>) {
        expect(result.data, mockSubjects);
      } else {
        fail('Expected a Success response, but got Fail');
      }
    });

    test('should return Fail when repository call fails', () async {
      // Arrange
      final error = Exception('Error occurred');

      when(mockSurveyRepository.getSubjects())
          .thenAnswer((_) async => Fail(error));

      // Act
      final result = await getSubjectsUseCase.call();

      // Assert
      expect(result, isA<Fail<List<Subject>>>());
      if (result is Fail<List<Subject>>) {
        expect(result.exception, error);
      } else {
        fail('Expected a Fail response, but got Success');
      }
    });
  });
}
