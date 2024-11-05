import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
   String? username;
   String? firstName;
   String? lastName;
   String? email;
   String? phone;

  UserRequest(
      {this.username, this.firstName, this.lastName, this.email, this.phone});



  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
