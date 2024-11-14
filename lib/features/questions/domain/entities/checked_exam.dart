import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
@JsonSerializable()
class CheckedExam extends Equatable {
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
   late  List<Question> checkedQuestions;
   late  List<CheckAnswers> checkAnswers;

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, duration, subject, numberOfQuestions, active, ];

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
@JsonSerializable()
class CheckAnswers {
  final String? questionId;
   final String? correct;

  CheckAnswers({required this.questionId, required this.correct});


}