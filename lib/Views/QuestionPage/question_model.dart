// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
  QuestionModel({
    required this.question,
  });

  String question;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    question: json["question"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
  };
}
