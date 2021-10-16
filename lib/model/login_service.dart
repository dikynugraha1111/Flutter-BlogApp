// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
