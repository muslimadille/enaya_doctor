import 'package:enaya_doctor/features/splash_screen/model/country_model.dart';
import 'package:enaya_doctor/features/splash_screen/repository/splash_screen_repo.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier{
  late final CountryModel selectedCountry;
  List<CountryModel> allCountries=[];

  final SplashScreenRepo splashScreenRepo=SplashScreenRepo();
  getCountries()async{
    final response = await splashScreenRepo.getAllCountries();
    allCountries=CountryModel.fromList(response.data);
    notifyListeners();
  }
  setSelectedCountry(CountryModel country){
    selectedCountry=country;
    notifyListeners();
  }

}