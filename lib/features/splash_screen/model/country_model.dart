// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final String phoneCode;
  final String currencyEn;
  final String currencyAr;
  final String createdAt;
  final String updatedAt;
  final String flag;

  CountryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.phoneCode,
    required this.currencyEn,
    required this.currencyAr,
    required this.createdAt,
    required this.updatedAt,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"]??-1,
    nameEn: json["name_en"]??"",
    nameAr: json["name_ar"]??"",
    phoneCode: json["phone_code"]??'',
    currencyEn: json["currency_en"]??'',
    currencyAr: json["currency_ar"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    flag: json["flag"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "name_ar": nameAr,
    "phone_code": phoneCode,
    "currency_en": currencyEn,
    "currency_ar": currencyAr,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "flag": flag,
  };
  static List<CountryModel> fromList(List<dynamic>? data){
    return data==null?[]:List<CountryModel>.from(data.map((e) => CountryModel.fromJson(e)))  ;
  }
}
