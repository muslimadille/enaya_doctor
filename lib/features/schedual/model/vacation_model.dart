// To parse this JSON data, do
//
//     final vacationModel = vacationModelFromJson(jsonString);

import 'dart:convert';

VacationModel vacationModelFromJson(String str) => VacationModel.fromJson(json.decode(str));

String vacationModelToJson(VacationModel data) => json.encode(data.toJson());

class VacationModel {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final dynamic doctorId;

  VacationModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.doctorId,
  });

  factory VacationModel.fromJson(Map<String, dynamic> json) => VacationModel(
    id: json["id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "doctor_id": doctorId,
  };
  static List<VacationModel> fromList(List<dynamic>? data){
    return data==null?[]:List<VacationModel>.from(data.map((e) => VacationModel.fromJson(e)))  ;
  }
}
