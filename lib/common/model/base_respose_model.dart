// To parse this JSON data, do
//
//     final baseResponsesModel = baseResponsesModelFromJson(jsonString);

import 'dart:convert';

BaseResponsesModel baseResponsesModelFromJson(String str) => BaseResponsesModel.fromJson(json.decode(str));

String baseResponsesModelToJson(BaseResponsesModel data) => json.encode(data.toJson());

class BaseResponsesModel {
  final int status;
  final bool success;
  final dynamic data;
  final String message;

  BaseResponsesModel({
    required this.status,
    required this.success,
    required this.data,
    required this.message
  });

  factory BaseResponsesModel.fromJson(Map<String, dynamic> json) => BaseResponsesModel(
    status: json["status"]??500,
    success: json["success"]??false,
    data: json["data"],
    message: json["message"]??''
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data,
    'message':message
  };
}
