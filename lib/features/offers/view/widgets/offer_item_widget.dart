import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/api_codes.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/offers/model/doctor_offer_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OfferItemWidget extends StatelessWidget {
  final DoctorOfferModel offerModel;
  final Function onClick;
  const OfferItemWidget({
     required this.offerModel,
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2.w),
      decoration: const BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.fromBorderSide(BorderSide(
            width: 1,
            color: AppColors.BASE_COLOR,
          )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 15.h,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(ApiBaseUrl.SERVER_DOMAIN+offerModel.images[0].featured))
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(2.w),
            child: Row(children: [
               Text(tr("offer_title"),style: TextStyle(fontWeight: FontWeight.w800),), Text(LocalProvider().isEnglish()?offerModel!.titleEn:offerModel!.titleAr)
            ],),
          ),
          Padding(
            padding:  EdgeInsets.all(2.w),
            child: Row(children: [
              Text(tr("offer_subtitle"),style: TextStyle(fontWeight: FontWeight.w800)), Text(LocalProvider().isEnglish()?offerModel!.descriptionEn:offerModel!.descriptionAr)
            ],),
          ),
          Padding(
            padding:  EdgeInsets.all(2.w),
            child: Row(children: [
              Text(tr("offer_price"),style: TextStyle(fontWeight: FontWeight.w800)), Text(offerModel!.price)
            ],),
          )

        ],
      ) ,
    );
  }
}
