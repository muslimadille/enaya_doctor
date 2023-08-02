import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';

mixin MoreScreenHelper{
  onLogoutClick(){
    AppConstants.prefs.setString("token","");
    AppNavigator().pushAndRemoveAll(routeName: AppRoutes.SPLASH_SCREEN_ROUTE);
  }

  onChangeLanguageClick(){
    AppNavigator().push(routeName: AppRoutes.CHANGE_LANGUAGE_SCREEN_ROUTE);
  }
  onAboutUsClick(){
    AppNavigator().push(routeName: AppRoutes.ABOUT_US_SCREEN_ROUTE);
  }

}