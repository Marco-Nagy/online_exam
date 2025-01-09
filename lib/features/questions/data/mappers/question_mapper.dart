import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/data/models/online/question_response_model.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
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

  static CheckedExam toQuestionResponseModel(Exam exam) {
    return CheckedExam(
        id: exam.id,
        title: exam.title,
        duration: exam.duration,
        subject: exam.subject,
        numberOfQuestions: exam.numberOfQuestions,
        active: exam.active,
        checkedQuestions: [], checkAnswers: [], correctAnswers: 0,);
  }
}
