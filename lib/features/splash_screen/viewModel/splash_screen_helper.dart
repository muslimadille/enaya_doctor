import 'package:enaya_doctor/features/splash_screen/model/country_model.dart';
import 'package:enaya_doctor/features/splash_screen/repository/splash_screen_repo.dart';

mixin SplashScreenHelper{
  final SplashScreenRepo splashScreenRepo=SplashScreenRepo();
  getCountries()async{
      final response = await splashScreenRepo.getQuickOptions();
      List<CountryModel> data=response.data ;
  }
}