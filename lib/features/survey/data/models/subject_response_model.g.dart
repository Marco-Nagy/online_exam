// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponseModel _$SubjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubjectResponseModel(
      json['message'] as String?,
      json['metadata'] == null
          ? null
          : SubjectMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      (json['subjects'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseModelToJson(
        SubjectResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };

SubjectMetadata _$SubjectMetadataFromJson(Map<String, dynamic> json) =>
    SubjectMetadata(
      (json['currentPage'] as num?)?.toInt(),
      (json['numberOfPages'] as num?)?.toInt(),
      (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubjectMetadataToJson(SubjectMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      json['_id'] as String?,
      json['name'] as String?,
      json['icon'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };
