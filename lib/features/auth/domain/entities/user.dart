class User {
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
}