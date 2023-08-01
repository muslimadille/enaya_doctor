// To parse this JSON data, do
//
//     final workingDayModel = workingDayModelFromJson(jsonString);

import 'dart:convert';

import 'package:enaya_doctor/features/schedual/model/working_duration_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_time_model.dart';


WorkingDayModel workingDayModelFromJson(String str) => WorkingDayModel.fromJson(json.decode(str));

String workingDayModelToJson(WorkingDayModel data) => json.encode(data.toJson());

class WorkingDayModel {
  final int? id;
  final int? dayId;
   int? timeFromId;
   int? timeToId;
   int? durationId;
   String? status;
  final String? doctorId;
  final String? createdAt;
  final String? updatedAt;
  final Day? day;
   WorkingTImeModel? timeFrom;
   WorkingDurationModel? duration;
   WorkingTImeModel? timeTo;

  WorkingDayModel({
    required this.id,
    required this.dayId,
    required this.timeFromId,
    required this.timeToId,
    required this.durationId,
    required this.status,
    required this.doctorId,
    required this.createdAt,
    required this.updatedAt,
    required this.day,
    required this.timeFrom,
    required this.duration,
    required this.timeTo,
  });

  factory WorkingDayModel.fromJson(Map<String, dynamic> json) => WorkingDayModel(
    id: json["id"],
    dayId: json["day_id"],
    timeFromId: json["time_from_id"],
    timeToId: json["time_to_id"],
    durationId: json["duration_id"],
    status: json["status"],
    doctorId: json["doctor_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    day: Day.fromJson(json["day"]),
    timeFrom: json["time_from"]!=null?WorkingTImeModel.fromJson(json["time_from"]):null,
    duration: json["duration"]!=null?WorkingDurationModel.fromJson(json["duration"]):null,
    timeTo: json["time_to"]!=null?WorkingTImeModel.fromJson(json["time_to"]):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day_id": dayId,
    "time_from_id": timeFromId,
    "time_to_id": timeToId,
    "duration_id": durationId,
    "status": status,
    "doctor_id": doctorId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "day": day!.toJson(),
    "time_from": timeFrom!.toJson(),
    "duration": duration!.toJson(),
    "time_to": timeTo!.toJson(),
  };
  static List<WorkingDayModel> fromList(List<dynamic>? data){
    return data==null?[]:List<WorkingDayModel>.from(data.map((e) => WorkingDayModel.fromJson(e)))  ;
  }
}

class Day {
  final int id;
  final String nameEn;
  final String nameAr;
  final DateTime createdAt;
  final DateTime updatedAt;

  Day({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
