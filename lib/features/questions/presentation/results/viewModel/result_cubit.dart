import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/use_cases/get_exam_answers_use_case.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  ResultCubit(this.getExamAnswersUseCase) : super(ResultInitial());
  final GetExamAnswersUseCase getExamAnswersUseCase;
  List<CheckedExam> exams = [];
  Future<void> getSubmittedExamsList() async {
    emit(ResultLoadingState());

    var response = await getExamAnswersUseCase();

    switch (response) {
      case Success<List<CheckedExam>>():
        {
          // getIt<ParseErrorLogger>().i(result.data);
          exams = response.data;

          emit(GetSubmittedExamsListSuccessState(response.data));
        }

      case Fail():
        final errorMessage = ErrorHandler.handle(response.exception!).message;
        emit(ResultErrorState(errorMessage!));
    }
  }

}
