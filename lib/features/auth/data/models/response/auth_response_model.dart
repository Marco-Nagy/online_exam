import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponse {
  final String? message;
  final String? token;
  final UserModel? user;

  AuthResponse(this.message, this.token, this.user);

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);


}

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  UserModel(
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);


}
