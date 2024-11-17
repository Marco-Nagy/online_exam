import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

class CheckedExam  {
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
   late  List<Question> checkedQuestions;
   late  List<CheckAnswers> checkAnswers;


   CheckedExam( {
    required this.id,
     required this.checkAnswers,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.checkedQuestions,
  });
}

class CheckAnswers {
  final String? questionId;
   final String? correct;

  CheckAnswers({required this.questionId, required this.correct});


}