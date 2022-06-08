// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

List<AuthModel> authModelFromJson(String str) => List<AuthModel>.from(json.decode(str).map((x) => AuthModel.fromJson(x)));

String authModelToJson(List<AuthModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthModel {
  AuthModel({
    required this.username,
  });

  String username;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}
