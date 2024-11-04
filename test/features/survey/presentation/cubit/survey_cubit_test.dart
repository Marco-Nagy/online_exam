import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/features/survey/domain/use_cases/get_subjects.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';
import 'package:online_exam/features/survey/presentation/cubit/survey_cubit.dart';
import 'package:online_exam/features/survey/presentation/cubit/survey_states.dart';

class MockGetSubjectsUseCase extends Mock implements GetSubjectsUseCase {}

void main() {
  late SubjectCubit subjectCubit;
  late MockGetSubjectsUseCase mockGetSubjects;

  setUp(() {
    mockGetSubjects = MockGetSubjectsUseCase();
    subjectCubit = SubjectCubit(mockGetSubjects);
  });

  group('SubjectCubit', () {
    test('initial state is SubjectInitial', () {
      expect(subjectCubit.state, isA<SubjectInitial>());
    });

    test('emits GetSubjectLoading and then GetSubjectSuccess when subjects are fetched successfully', () async {
      final subjects = [Subject(id: '1', name: 'Math', icon: 'icon_math')];
      when(mockGetSubjects()).thenAnswer((_) async => Success<List<Subject>>(subjects));

      subjectCubit.getSubject();

      expectLater(subjectCubit.stream, emitsInOrder([
        isA<GetSubjectLoading>(),
        isA<GetSubjectSuccess>().having((state) => state.subject, 'subjects', subjects),
      ]));

      await subjectCubit.getSubject(); // Ensure to await to allow stream to process
    });

    test('emits GetSubjectLoading and then GetSubjectError when fetching subjects fails', () async {
      final error = Exception('An error occurred');
      when(mockGetSubjects()).thenAnswer((_) async => Fail<List<Subject>>(error));

      subjectCubit.getSubject();

      expectLater(subjectCubit.stream, emitsInOrder([
        isA<GetSubjectLoading>(),
        isA<GetSubjectError>().having((state) => state.errorModel.message, 'error message', 'An error occurred'),
      ]));

      await subjectCubit.getSubject(); // Ensure to await to allow stream to process
    });
  });
}
