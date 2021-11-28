// To parse this JSON data, do
//
//     final lovePercentageModel = lovePercentageModelFromJson(jsonString);

import 'dart:convert';

LovePercentageModel lovePercentageModelFromJson(String str) =>
    LovePercentageModel.fromJson(json.decode(str));

String lovePercentageModelToJson(LovePercentageModel data) =>
    json.encode(data.toJson());

class LovePercentageModel {
  LovePercentageModel({
    required this.fname,
    required this.sname,
    required this.percentage,
    required this.result,
  });

  String fname;
  String sname;
  String percentage;
  String result;

  factory LovePercentageModel.fromJson(Map<String, dynamic> json) =>
      LovePercentageModel(
        fname: json["fname"],
        sname: json["sname"],
        percentage: json["percentage"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "sname": sname,
        "percentage": percentage,
        "result": result,
      };
}
