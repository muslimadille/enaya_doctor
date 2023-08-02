import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/check_internet.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:enaya_doctor/features/auth/view/screens/login_screen.dart';
import 'package:enaya_doctor/features/home_screen/view/home_screen.dart';
import 'package:enaya_doctor/features/more/view/screens/change_language_screen.dart';
import 'package:enaya_doctor/features/schedual/view/screens/add_vacation_screen.dart';
import 'package:enaya_doctor/features/schedual/view/screens/edit_working_times_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/select_country_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/select_user_screen.dart';
import 'package:enaya_doctor/features/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

mixin class MyAppHelper{

  initConnection(){
    bool isConnectionShowing = false;
    CheckInternet connectionStatus = CheckInternet();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen((hasConnection){
      if (hasConnection) {
        if (isConnectionShowing) {
          AppNavigator().goBack();
          // OverlayCustom().hideOverlay();
        }
      } else {
        isConnectionShowing = true;
        //AppNavigator().push(routeName: AppRoutes.NO_INTERNET_SCREEN_ROUTE);
      }
    });
  }

  Future<DateTime?> pickDate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: AppNavigator().currentContext(),
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime.now(),
        lastDate: DateTime(2090, 8)
    );
    return picked;
  }

 /* Widget startRoutSelector(){
    if(LocalStorage().getFromBox(key: StorageKeys.IS_NOT_FRIST_TIME)??false){
      return  Container();
    }else{
      return  Container();
    }
  }*/

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());

      case AppRoutes.SELECT_USER_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SelectUserScreen());

      case AppRoutes.SELECT_COUNTRY_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const SelectCountryScreen());

      case AppRoutes.LOGIN_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());

      case AppRoutes.HOME_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());

    case AppRoutes.EDIT_WORKING_TIMES_SCREEN_ROUTE:
    return MaterialPageRoute(builder: (_) =>  const EditWorkingTimesScreen());

      case AppRoutes.ADD_VACATION_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const AddVacationScreen());

      case AppRoutes.CHANGE_LANGUAGE_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) =>  const ChangeLanguageScreen());







      default:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());
    }
  }
}