// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_check_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionCheckRequest _$QuestionCheckRequestFromJson(
        Map<String, dynamic> json) =>
    QuestionCheckRequest(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => CheckAnswers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionCheckRequestToJson(
        QuestionCheckRequest instance) =>
    <String, dynamic>{
      'answers': instance.answers,
    };

CheckAnswers _$CheckAnswersFromJson(Map<String, dynamic> json) => CheckAnswers(
      questionId: json['questionId'] as String,
      correct: json['correct'] as String,
    );

Map<String, dynamic> _$CheckAnswersToJson(CheckAnswers instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
