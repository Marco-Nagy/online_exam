import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  final String? oldPassword;
  final String? password;
  final String? rePassword;

  ChangePasswordRequest(this.oldPassword, this.password, this.rePassword);


  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
