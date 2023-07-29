// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  final int id;
  final String phonenumber;
  final dynamic email;
  final int genderId;
  final String active;
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
  final dynamic code;
  final dynamic codeExpiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int profileCompleted;
  final String requestRegister;
  final String govId;
  final String cityId;
  final dynamic clinicName;
  final List<PrefixTitle> doctorServices;
  final List<dynamic> clinicPhotos;
  final List<dynamic> clinicServices;
  final List<SubSpecialty> subSpecialties;
  final Area area;
  final Specialty specialty;
  final PrefixTitle prefixTitle;
  final PrefixTitle profissionalDetails;

  DoctorModel({
    required this.id,
    required this.phonenumber,
    this.email,
    required this.genderId,
    required this.active,
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
    this.code,
    this.codeExpiresAt,
    required this.createdAt,
    required this.updatedAt,
    required this.profileCompleted,
    required this.requestRegister,
    required this.govId,
    required this.cityId,
    this.clinicName,
    required this.doctorServices,
    required this.clinicPhotos,
    required this.clinicServices,
    required this.subSpecialties,
    required this.area,
    required this.specialty,
    required this.prefixTitle,
    required this.profissionalDetails,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["id"],
    phonenumber: json["phonenumber"],
    email: json["email"]??"",
    genderId: json["gender_id"],
    active: json["active"],
    featured: json["featured"],
    firstNameEn: json["firstName_en"],
    firstNameAr: json["firstName_ar"],
    lastNameEn: json["lastName_en"],
    lastNameAr: json["lastName_ar"],
    specialtyId: json["specialty_id"],
    prefixTitleId: json["prefix_title_id"],
    profissionalDetailsId: json["profissionalDetails_id"],
    profissionalTitleEn: json["profissionalTitle_en"],
    profissionalTitleAr: json["profissionalTitle_ar"],
    aboutDoctorAr: json["aboutDoctor_ar"],
    aboutDoctorEn: json["aboutDoctor_en"],
    practiceLicenseId: json["practiceLicenseID"],
    profissionalTitleId: json["profissionalTitleID"],
    price: json["price"],
    addressEn: json["address_en"],
    addressAr: json["address_ar"],
    landmarkEn: json["landmark_en"],
    landmarkAr: json["landmark_ar"],
    areaId: json["area_id"],
    waitingTime: json["waiting_time"],
    numOfDay: json["num_of_day"],
    lat: json["lat"],
    lng: json["lng"],
    countryId: json["country_id"],
    code: json["code"],
    codeExpiresAt: json["code_expires_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    profileCompleted: json["profile_completed"],
    requestRegister: json["request_register"],
    govId: json["gov_id"],
    cityId: json["city_id"],
    clinicName: json["clinic_name"]??"",
    doctorServices: List<PrefixTitle>.from(json["doctor_services"].map((x) => PrefixTitle.fromJson(x))),
    clinicPhotos: List<dynamic>.from(json["clinic_photos"].map((x) => x)),
    clinicServices: List<dynamic>.from(json["clinic_services"].map((x) => x)),
    subSpecialties: List<SubSpecialty>.from(json["sub_specialties"].map((x) => SubSpecialty.fromJson(x))),
    area: Area.fromJson(json["area"]),
    specialty: Specialty.fromJson(json["specialty"]),
    prefixTitle: PrefixTitle.fromJson(json["prefix_title"]),
    profissionalDetails: PrefixTitle.fromJson(json["profissional_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phonenumber": phonenumber,
    "email": email,
    "gender_id": genderId,
    "active": active,
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
    "code": code,
    "code_expires_at": codeExpiresAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "profile_completed": profileCompleted,
    "request_register": requestRegister,
    "gov_id": govId,
    "city_id": cityId,
    "clinic_name": clinicName,
    "doctor_services": List<dynamic>.from(doctorServices.map((x) => x.toJson())),
    "clinic_photos": List<dynamic>.from(clinicPhotos.map((x) => x)),
    "clinic_services": List<dynamic>.from(clinicServices.map((x) => x)),
    "sub_specialties": List<dynamic>.from(subSpecialties.map((x) => x.toJson())),
    "area": area.toJson(),
    "specialty": specialty.toJson(),
    "prefix_title": prefixTitle.toJson(),
    "profissional_details": profissionalDetails.toJson(),
  };
}

class Area {
  final int id;
  final String areaEn;
  final String areaAr;
  final String countryId;
  final dynamic createdAt;
  final DateTime updatedAt;
  final String govId;
  final dynamic deletedAt;
  final String cityId;

  Area({
    required this.id,
    required this.areaEn,
    required this.areaAr,
    required this.countryId,
    this.createdAt,
    required this.updatedAt,
    required this.govId,
    this.deletedAt,
    required this.cityId,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    areaEn: json["area_en"],
    areaAr: json["area_ar"],
    countryId: json["country_id"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    govId: json["gov_id"],
    deletedAt: json["deleted_at"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area_en": areaEn,
    "area_ar": areaAr,
    "country_id": countryId,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "gov_id": govId,
    "deleted_at": deletedAt,
    "city_id": cityId,
  };
}

class PrefixTitle {
  final int id;
  final String nameEn;
  final String nameAr;
  final String? doctorId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PrefixTitle({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    this.doctorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PrefixTitle.fromJson(Map<String, dynamic> json) => PrefixTitle(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    doctorId: json["doctor_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "doctor_id": doctorId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Specialty {
  final int id;
  final String nameEn;
  final String nameAr;
  final String icon;
  final String property;
  final DateTime createdAt;
  final DateTime updatedAt;

  Specialty({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.icon,
    required this.property,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    icon: json["icon"],
    property: json["property"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "icon": icon,
    "property": property,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class SubSpecialty {
  final int id;
  final String nameEn;
  final String nameAr;
  final String specialtyId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  SubSpecialty({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.specialtyId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory SubSpecialty.fromJson(Map<String, dynamic> json) => SubSpecialty(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    specialtyId: json["specialty_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "specialty_id": specialtyId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  final String doctorId;
  final String subSpecialtyId;

  Pivot({
    required this.doctorId,
    required this.subSpecialtyId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    doctorId: json["doctor_id"],
    subSpecialtyId: json["sub_specialty_id"],
  );

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "sub_specialty_id": subSpecialtyId,
  };
}
