import 'package:enaya_doctor/features/offers/model/doctor_offer_model.dart';
import 'package:enaya_doctor/features/offers/repository/offers_repo.dart';

mixin OffersHelper{
  late List<DoctorOfferModel> doctorOffers=[];
  Future getDoctorOffers()async{
    doctorOffers.clear();
    await OffersRepo().getDoctorOffers().then((value){
      doctorOffers.addAll(DoctorOfferModel.fromList(value.data));
    });
  }
}