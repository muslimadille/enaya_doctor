
// To parse this JSON data, do
//
//     final doctorOfferModel = doctorOfferModelFromJson(jsonString);

import 'dart:convert';

DoctorOfferModel doctorOfferModelFromJson(String str) => DoctorOfferModel.fromJson(json.decode(str));

String doctorOfferModelToJson(DoctorOfferModel data) => json.encode(data.toJson());

class DoctorOfferModel {
  final int id;
  final int offerCategoryId;
  final int offerSubCategoryId;
  final int offerServiceId;
  final int offerSubServiceId;
  final int offerUnitId;
  final String unitNumber;
  final String deviceNameEn;
  final String deviceNameAr;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String price;
  final String discount;
  final String dateFrom;
  final String dateTo;
  final String active;
  final String doctorId;
  final String laboratoryId;
  final List<ImageModel> images;

  DoctorOfferModel({
    required this.id,
    required this.offerCategoryId,
    required this.offerSubCategoryId,
    required this.offerServiceId,
    required this.offerSubServiceId,
    required this.offerUnitId,
    required this.unitNumber,
    required this.deviceNameEn,
    required this.deviceNameAr,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.discount,
    required this.dateFrom,
    required this.dateTo,
    required this.active,
    required this.doctorId,
    required this.laboratoryId,
    required this.images,
  });
  static List<DoctorOfferModel> fromList(List<dynamic>? data){
    return data==null?[]:List<DoctorOfferModel>.from(data.map((e) => DoctorOfferModel.fromJson(e)))  ;
  }
  factory DoctorOfferModel.fromJson(Map<String, dynamic> json) => DoctorOfferModel(
    id: json["id"],
    offerCategoryId: json["offer_category_id"],
    offerSubCategoryId: json["offer_sub_category_id"],
    offerServiceId: json["offer_service_id"],
    offerSubServiceId: json["offer_sub_service_id"],
    offerUnitId: json["offer_unit_id"],
    unitNumber: json["unit_number"],
    deviceNameEn: json["device_name_en"],
    deviceNameAr: json["device_name_ar"],
    titleEn: json["title_en"],
    titleAr: json["title_ar"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    price: json["price"],
    discount: json["discount"],
    dateFrom: json["date_from"],
    dateTo: json["date_to"],
    active: json["active"],
    doctorId: json["doctor_id"],
    laboratoryId: json["laboratory_id"],
    images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_category_id": offerCategoryId,
    "offer_sub_category_id": offerSubCategoryId,
    "offer_service_id": offerServiceId,
    "offer_sub_service_id": offerSubServiceId,
    "offer_unit_id": offerUnitId,
    "unit_number": unitNumber,
    "device_name_en": deviceNameEn,
    "device_name_ar": deviceNameAr,
    "title_en": titleEn,
    "title_ar": titleAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "price": price,
    "discount": discount,
    "date_from": dateFrom,
    "date_to": dateTo,
    "active": active,
    "doctor_id": doctorId,
    "laboratory_id": laboratoryId,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };

}

class ImageModel {
  final int id;
  final String offerId;
  final String featured;
  final String sort;

  ImageModel({
    required this.id,
    required this.offerId,
    required this.featured,
    required this.sort,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    offerId: json["offer_id"],
    featured: json["featured"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "featured": featured,
    "sort": sort,
  };
}
