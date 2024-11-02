// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      json['message'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['_id'] as String?,
      json['username'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['role'] as String?,
      json['isVerified'] as bool?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
    };
