import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';

mixin SelectCountryScreenHelper{
  onNext(){
    AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
  }
}