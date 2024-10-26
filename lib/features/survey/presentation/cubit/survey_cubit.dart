import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

import '../../domain/use_cases/get_subjects.dart';
import 'survey_states.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.getSubjects) : super(SubjectInitial());
  final GetSubjectsUseCase getSubjects;

  Future<void> getSubject() async {
    emit(GetSubjectLoading());
    var response = await getSubjects();
    switch (response) {
      case Success<List<Subject>>():
        print("====================${response.data.map((e) => e.name,).toList()}");
        emit(GetSubjectSuccess(response.data));
      case Fail():
        emit(GetSubjectError(ErrorHandler.handle(response.exception!)));
    }
  }
}
