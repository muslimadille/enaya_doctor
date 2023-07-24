// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:enaya_doctor/features/auth/model/doctor_model.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final DoctorModel doctor;
  final String token;
  final int status;

  LoginModel({
    required this.doctor,
    required this.token,
    required this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    doctor: DoctorModel.fromJson(json["doctor"]),
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "doctor": doctor,
    "token": token,
    "status": status,
  };
}
