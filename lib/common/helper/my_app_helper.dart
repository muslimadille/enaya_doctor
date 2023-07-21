import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/check_internet.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
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

      default:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
    }
  }
}