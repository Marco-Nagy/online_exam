// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponseModel _$ExamResponseModelFromJson(Map<String, dynamic> json) =>
    ExamResponseModel(
      json['message'] as String?,
      json['metadata'] == null
          ? null
          : ExamsMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      (json['exams'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Exams.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamResponseModelToJson(ExamResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };

ExamsMetadata _$ExamsMetadataFromJson(Map<String, dynamic> json) =>
    ExamsMetadata(
      (json['currentPage'] as num?)?.toInt(),
      (json['numberOfPages'] as num?)?.toInt(),
      (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExamsMetadataToJson(ExamsMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

Exams _$ExamsFromJson(Map<String, dynamic> json) => Exams(
      json['_id'] as String?,
      json['title'] as String?,
      (json['duration'] as num?)?.toInt(),
      json['subject'] as String?,
      (json['numberOfQuestions'] as num?)?.toInt(),
      json['active'] as bool?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamsToJson(Exams instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
