class AuthResponse {
  AuthResponse({
      this.message, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;



}