class VerifyResetCodeRequest {
  VerifyResetCodeRequest({
      this.resetCode,});

  VerifyResetCodeRequest.fromJson(dynamic json) {
    resetCode = json['resetCode'];
  }
  String? resetCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }

}