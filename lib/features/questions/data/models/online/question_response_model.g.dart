// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseModel _$QuestionResponseModelFromJson(
        Map<String, dynamic> json) =>
    QuestionResponseModel(
      json['message'] as String?,
      (json['questions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : QuestionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      (json['answers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AnswersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
      json['_id'] as String?,
      json['question'] as String?,
      json['correct'] as String?,
      json['subject'] == null
          ? null
          : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
      json['exam'] == null
          ? null
          : ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      json['createdAt'] as String?,
    );

AnswersModel _$AnswersModelFromJson(Map<String, dynamic> json) => AnswersModel(
      json['answer'] as String?,
      json['key'] as String?,
    );

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      json['_id'] as String?,
      json['name'] as String?,
      json['icon'] as String?,
      json['createdAt'] as String?,
    );


ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => ExamModel(
      json['_id'] as String?,
      json['title'] as String?,
      (json['duration'] as num?)?.toInt(),
      json['subject'] as String?,
      (json['numberOfQuestions'] as num?)?.toInt(),
      json['active'] as bool?,
      json['createdAt'] as String?,
    );
