import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';

mixin SelectUserScreenHelper{
  onClick(){
    AppNavigator().push(routeName: AppRoutes.SELECT_COUNTRY_SCREEN_ROUTE);
  }

}