import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/core/networking/error/error_handler.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/domain/use_cases/get_questions_for_exam_use_case.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.getQuestionsForExam) : super(QuestionInitial());

  final GetQuestionsForExamUseCase getQuestionsForExam;

  Future<void> getQuestions(String examId) async {
    emit(GetQuestionLoading());

    var response = await getQuestionsForExam.getQuestionsForExam(examId);

    switch (response) {
      case Success<List<Question>>():
        emit(GetQuestionSuccess(response.data));
      case Fail():
        final errorMessage = ErrorHandler.handle(response.exception!).message;
        emit(GetQuestionError(errorMessage!));
    }
  }
}
