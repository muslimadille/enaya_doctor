// To parse this JSON data, do
//
//     final reservationModel = reservationModelFromJson(jsonString);

import 'dart:convert';

ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());

class ReservationModel {
  final int id;
  final String name;
  final String email;
  final String phonenumber;
  final String clientId;
  final String doctorId;
  final DateTime bookingDate;
   int statusId;
  final int offerId;
  final String byDoctor;

  ReservationModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.clientId,
    required this.doctorId,
    required this.bookingDate,
    required this.statusId,
    required this.offerId,
    required this.byDoctor,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phonenumber: json["phonenumber"],
    clientId: json["client_id"],
    doctorId: json["doctor_id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    statusId: json["status_id"],
    offerId: json["offer_id"],
    byDoctor: json["by_doctor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phonenumber": phonenumber,
    "client_id": clientId,
    "doctor_id": doctorId,
    "booking_date": bookingDate.toIso8601String(),
    "status_id": statusId,
    "offer_id": offerId,
    "by_doctor": byDoctor,
  };
  static List<ReservationModel> fromList(List<dynamic>? data){
    return data==null?[]:List<ReservationModel>.from(data.map((e) => ReservationModel.fromJson(e)))  ;
  }
}
