class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token});

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;
}