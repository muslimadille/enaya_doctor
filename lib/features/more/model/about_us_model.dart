// To parse this JSON data, do
//
//     final aboutUsModel = aboutUsModelFromJson(jsonString);

import 'dart:convert';

AboutUsModel aboutUsModelFromJson(String str) => AboutUsModel.fromJson(json.decode(str));

String aboutUsModelToJson(AboutUsModel data) => json.encode(data.toJson());

class AboutUsModel {
  final String aboutUsEn;
  final String aboutUsAr;

  AboutUsModel({
    required this.aboutUsEn,
    required this.aboutUsAr,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
    aboutUsEn: json["aboutUs_en"],
    aboutUsAr: json["aboutUs_ar"],
  );

  Map<String, dynamic> toJson() => {
    "aboutUs_en": aboutUsEn,
    "aboutUs_ar": aboutUsAr,
  };
  static List<AboutUsModel> fromList(List<dynamic>? data){
    return data==null?[]:List<AboutUsModel>.from(data.map((e) => AboutUsModel.fromJson(e)))  ;
  }
}
