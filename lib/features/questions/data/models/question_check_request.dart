import 'package:json_annotation/json_annotation.dart';

part 'question_check_request.g.dart';

@JsonSerializable()
class QuestionCheckRequest {
  final List<CheckAnswers> answers;

  QuestionCheckRequest({required this.answers});

  factory QuestionCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$QuestionCheckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionCheckRequestToJson(this);
}

@JsonSerializable()
class CheckAnswers {
  final String? questionId;
   final String? correct;

  CheckAnswers({required this.questionId, required this.correct});

  factory CheckAnswers.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAnswersToJson(this);
}
