

class Question  {
  final List<QuestionAnswers> answers;
  final String type;
  final String id;
  final String question;
  final String correct;
  final QuestionExam? exam;

   const Question({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
     this.exam,
  });


}

class QuestionAnswers  {
  final String answer;
  final String key;

  const QuestionAnswers({
    required this.answer,
    required this.key,
  });

}

class QuestionExam {
  final int duration;
  final int numberOfQuestions;

  const QuestionExam({
    required this.duration,
    required this.numberOfQuestions,
  });
}

