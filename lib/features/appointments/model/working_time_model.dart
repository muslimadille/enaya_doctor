// To parse this JSON data, do
//
//     final workingTImeModel = workingTImeModelFromJson(jsonString);

import 'dart:convert';

WorkingTImeModel workingTImeModelFromJson(String str) => WorkingTImeModel.fromJson(json.decode(str));

String workingTImeModelToJson(WorkingTImeModel data) => json.encode(data.toJson());

class WorkingTImeModel {
  final int id;
  final String timeEn;
  final String timeAr;

  WorkingTImeModel({
    required this.id,
    required this.timeEn,
    required this.timeAr,
  });

  factory WorkingTImeModel.fromJson(Map<String, dynamic> json) => WorkingTImeModel(
    id: json["id"],
    timeEn: json["time_en"],
    timeAr: json["time_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time_en": timeEn,
    "time_ar": timeAr,
  };
}
