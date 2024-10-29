import 'package:json_annotation/json_annotation.dart';

part 'question_response_model.g.dart';

@JsonSerializable()
class QuestionResponseModel {
  final String? message;
  final List<QuestionsModel?>? questions;

  QuestionResponseModel(this.message, this.questions);

  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseModelFromJson(json);

}

@JsonSerializable()
class QuestionsModel {
  final List<AnswersModel?>? answers;
  final String? type;
  @JsonKey(name: '_id')
  final String? id;
  final String? question;
  final String? correct;
  final SubjectModel? subject;
  final ExamModel? exam;
  final String? createdAt;

  QuestionsModel(this.answers, this.type, this.id,
      this.question, this.correct, this.subject, this.exam, this.createdAt);

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);

}

@JsonSerializable()
class AnswersModel {
  final String? answer;
  final String? key;

  AnswersModel(this.answer, this.key);

  factory AnswersModel.fromJson(
          Map<String, dynamic> json) =>
      _$AnswersModelFromJson(json);

}

@JsonSerializable()
class SubjectModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  SubjectModel(
      this.id, this.name, this.icon, this.createdAt);

  factory SubjectModel.fromJson(
          Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);


}

@JsonSerializable()
class ExamModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  ExamModel(this.id, this.title, this.duration,
      this.subject, this.numberOfQuestions, this.active, this.createdAt);

  factory ExamModel.fromJson(
          Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);


}
