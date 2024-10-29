import 'package:online_exam/features/questions/data/models/question_response_model.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

class QuestionMapper {
  static List<Question> toQuestionEntity(QuestionResponseModel questionResponse) {
    if (questionResponse.questions == null) return [];
    return questionResponse.questions!
        .map(
          (question) => Question(
            answers: question?.answers!
                    .map((answer) => QuestionAnswers(
                        answer: answer!.answer!, key: answer.key!))
                    .toList() ??
                [],
            type: question!.type!,
            id: question.id!,
            question: question.question!,
            correct: question.correct!,
            exam: QuestionExam(
                duration: question.exam!.duration!,
                numberOfQuestions: question.exam!.numberOfQuestions!),
          ),
        )
        .toList();
  }
}
