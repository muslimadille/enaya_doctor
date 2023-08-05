import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/offers/view/widgets/offer_item_widget.dart';
import 'package:flutter/material.dart';

import '../../view_model/offers_helper.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen>with OffersHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(
          showBack: false,
          title:tr("more"),),
        Expanded(child:
        FutureBuilder(
          future: getDoctorOffers(),
          builder: (context, _) {
            return ListView.builder(
              itemCount: doctorOffers.length,
                itemBuilder: (context,index){
              return OfferItemWidget(offerModel: doctorOffers[index], onClick: (){},);
            });
          }
        ))


      ],),);
  }
}
