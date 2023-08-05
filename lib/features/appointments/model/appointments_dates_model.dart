// To parse this JSON data, do
//
//     final appointmentDatesModel = appointmentDatesModelFromJson(jsonString);

import 'dart:convert';

AppointmentDatesModel appointmentDatesModelFromJson(String str) => AppointmentDatesModel.fromJson(json.decode(str));

String appointmentDatesModelToJson(AppointmentDatesModel data) => json.encode(data.toJson());

class AppointmentDatesModel {
  final List<Date> dates;

  AppointmentDatesModel({
    required this.dates,
  });

  factory AppointmentDatesModel.fromJson(Map<String, dynamic> json) => AppointmentDatesModel(
    dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
  };
}

class Date {
  final int id;
  final String date;
  final String dayAr;
  final String dayEn;
  final int status;
  final String? startTime;
  final String? endTime;
  final List<Time>? times;

  Date({
    required this.id,
    required this.date,
    required this.dayAr,
    required this.dayEn,
    required this.status,
    this.startTime,
    this.endTime,
    this.times,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"],
    date: json["date"],
    dayAr: json["day_ar"],
    dayEn: json["day_en"],
    status: json["status"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    times: json["times"] == null ? [] : List<Time>.from(json["times"]!.map((x) => Time.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date":date,
    "day_ar": dayAr,
    "day_en": dayEn,
    "status": status,
    "start_time": startTime,
    "end_time": endTime,
    "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x.toJson())),
  };
}

class Time {
  final String time;
  final int status;

  Time({
    required this.time,
    required this.status,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    time: json["time"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "status": status,
  };
}
