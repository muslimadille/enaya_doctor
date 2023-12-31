import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:provider/provider.dart';


mixin SplashScreenHelper{
  onInit()async{
    await AppNavigator().currentContext().read<CountryProvider>().getCountries();
    onFinishLoading();
  }
  onFinishLoading()async{
    String token  = AppConstants.prefs.getString("token")??'';
    if(token.isNotEmpty){
      AppNavigator().pushAndRemoveAll(routeName: AppRoutes.HOME_SCREEN_ROUTE);
    }else{
      AppNavigator().pushAndRemoveAll(routeName: AppRoutes.SELECT_USER_SCREEN_ROUTE);
    }
  }
}