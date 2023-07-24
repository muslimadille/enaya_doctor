// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  final int id;
  final String phonenumber;
  final String email;
  final String genderId;
  final String featured;
  final String firstNameEn;
  final String firstNameAr;
  final String lastNameEn;
  final String lastNameAr;
  final String specialtyId;
  final String prefixTitleId;
  final String profissionalDetailsId;
  final String profissionalTitleEn;
  final String profissionalTitleAr;
  final String aboutDoctorAr;
  final String aboutDoctorEn;
  final String practiceLicenseId;
  final String profissionalTitleId;
  final String price;
  final String addressEn;
  final String addressAr;
  final String landmarkEn;
  final String landmarkAr;
  final String areaId;
  final String waitingTime;
  final String numOfDay;
  final String lat;
  final String lng;
  final String countryId;
  final int profileCompleted;
  final String requestRegister;
  final String govId;
  final String cityId;

  DoctorModel({
    required this.id,
    required this.phonenumber,
    required this.email,
    required this.genderId,
    required this.featured,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.lastNameEn,
    required this.lastNameAr,
    required this.specialtyId,
    required this.prefixTitleId,
    required this.profissionalDetailsId,
    required this.profissionalTitleEn,
    required this.profissionalTitleAr,
    required this.aboutDoctorAr,
    required this.aboutDoctorEn,
    required this.practiceLicenseId,
    required this.profissionalTitleId,
    required this.price,
    required this.addressEn,
    required this.addressAr,
    required this.landmarkEn,
    required this.landmarkAr,
    required this.areaId,
    required this.waitingTime,
    required this.numOfDay,
    required this.lat,
    required this.lng,
    required this.countryId,
    required this.profileCompleted,
    required this.requestRegister,
    required this.govId,
    required this.cityId,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["id"]??-1,
    phonenumber: json["phonenumber"]??'',
    email: json["email"]??"",
    genderId: json["gender_id"]??"",
    featured: json["featured"]??"",
    firstNameEn: json["firstName_en"]??"",
    firstNameAr: json["firstName_ar"]??"",
    lastNameEn: json["lastName_en"]??"",
    lastNameAr: json["lastName_ar"]??"",
    specialtyId: json["specialty_id"]??"",
    prefixTitleId: json["prefix_title_id"]??"",
    profissionalDetailsId: json["profissionalDetails_id"]??"",
    profissionalTitleEn: json["profissionalTitle_en"]??"",
    profissionalTitleAr: json["profissionalTitle_ar"]??"",
    aboutDoctorAr: json["aboutDoctor_ar"]??"",
    aboutDoctorEn: json["aboutDoctor_en"]??"",
    practiceLicenseId: json["practiceLicenseID"]??"",
    profissionalTitleId: json["profissionalTitleID"]??"",
    price: json["price"]??"",
    addressEn: json["address_en"]??"",
    addressAr: json["address_ar"]??"",
    landmarkEn: json["landmark_en"]??"",
    landmarkAr: json["landmark_ar"]??"",
    areaId: json["area_id"]??"",
    waitingTime: json["waiting_time"]??"",
    numOfDay: json["num_of_day"]??"",
    lat: json["lat"]??"",
    lng: json["lng"]??"",
    countryId: json["country_id"]??"",
    profileCompleted: json["profile_completed"]??-1,
    requestRegister: json["request_register"]??"",
    govId: json["gov_id"]??"",
    cityId: json["city_id"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phonenumber": phonenumber,
    "email": email,
    "gender_id": genderId,
    "featured": featured,
    "firstName_en": firstNameEn,
    "firstName_ar": firstNameAr,
    "lastName_en": lastNameEn,
    "lastName_ar": lastNameAr,
    "specialty_id": specialtyId,
    "prefix_title_id": prefixTitleId,
    "profissionalDetails_id": profissionalDetailsId,
    "profissionalTitle_en": profissionalTitleEn,
    "profissionalTitle_ar": profissionalTitleAr,
    "aboutDoctor_ar": aboutDoctorAr,
    "aboutDoctor_en": aboutDoctorEn,
    "practiceLicenseID": practiceLicenseId,
    "profissionalTitleID": profissionalTitleId,
    "price": price,
    "address_en": addressEn,
    "address_ar": addressAr,
    "landmark_en": landmarkEn,
    "landmark_ar": landmarkAr,
    "area_id": areaId,
    "waiting_time": waitingTime,
    "num_of_day": numOfDay,
    "lat": lat,
    "lng": lng,
    "country_id": countryId,
    "profile_completed": profileCompleted,
    "request_register": requestRegister,
    "gov_id": govId,
    "city_id": cityId,
  };
}
