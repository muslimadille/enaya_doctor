// To parse this JSON data, do
//
//     final workingDurationModel = workingDurationModelFromJson(jsonString);

import 'dart:convert';

WorkingDurationModel workingDurationModelFromJson(String str) => WorkingDurationModel.fromJson(json.decode(str));

String workingDurationModelToJson(WorkingDurationModel data) => json.encode(data.toJson());

class WorkingDurationModel {
  final int id;
  final String durationEn;
  final String durationAr;

  WorkingDurationModel({
    required this.id,
    required this.durationEn,
    required this.durationAr,
  });

  factory WorkingDurationModel.fromJson(Map<String, dynamic> json) => WorkingDurationModel(
    id: json["id"],
    durationEn: json["duration_en"],
    durationAr: json["duration_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "duration_en": durationEn,
    "duration_ar": durationAr,
  };
}
