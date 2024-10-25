import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/ErrorModel.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/exam/domain/use_cases/get_all_exams_use_case.dart';
import 'package:online_exam/features/exam/presentation/viewModel/exam_base_actions.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  ExamCubit(this.getAllExamsUseCase) : super(ExamInitial());
  final GetAllExamsUseCase getAllExamsUseCase;

  void doAction(ExamBaseActions action) {
    switch (action) {
      case GetExamListBySubjectId():
        _getAllExamsBySubjectId(action);
    }
  }

  Future<void> _getAllExamsBySubjectId(GetExamListBySubjectId action) async {
    emit(LoadingExams());
    var result = await getAllExamsUseCase.call(action.subjectId);
    switch (result) {
      case Success<List<Exam>>():
        emit(SuccessExamList(exams: result.data));
      case Fail<List<Exam>>():
        emit(ErrorExams(errorModel: ErrorHandler.handle(result.exception!)));
    }
  }
}
