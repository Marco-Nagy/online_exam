import 'package:equatable/equatable.dart';

class User  extends Equatable {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.role,
    this.token});

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;

  @override
  List<Object?> get props => [id, username, firstName, lastName, role, email, phone, isVerified, token];
}