import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginApiModel extends Equatable {
  LoginApiModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
    this.code,
  });

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  String? code;

  factory LoginApiModel.fromJson(String str) {
    return LoginApiModel.fromMap(
      json.decode(str),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginApiModel.fromMap(Map<String, dynamic> json) {
    if (json["code"] == null) {
      return LoginApiModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );
    } else {
      return LoginApiModel(
        code: json["code"],
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "token": token == null ? null : token,
        "user_email": userEmail == null ? null : userEmail,
        "user_nicename": userNicename == null ? null : userNicename,
        "user_display_name": userDisplayName == null ? null : userDisplayName,
        "code": code == null ? null : code,
      };

  @override
  List<Object?> get props => [
        userEmail,
      ];
}
