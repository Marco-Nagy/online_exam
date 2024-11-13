import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Question extends Equatable {
  final List<QuestionAnswers> answers;
  final String type;
  @JsonKey(name: '_id')
  final String id;
  final String question;
  final String correct;
  final QuestionExam exam;

   const Question({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.exam,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        answers,
        type,
        id,
        question,
        correct,
        exam,
      ];
}

@JsonSerializable()
class QuestionAnswers extends Equatable {
  final String answer;
  final String key;

  const QuestionAnswers({
    required this.answer,
    required this.key,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        answer,
        key,
      ];
}

@JsonSerializable()
class QuestionExam extends Equatable {
  final int duration;
  final int numberOfQuestions;

  const QuestionExam({
    required this.duration,
    required this.numberOfQuestions,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        duration,
        numberOfQuestions,
      ];
}
