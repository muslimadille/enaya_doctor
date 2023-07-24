import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/features/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'common/providers/providers_list.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  AppConstants.prefs=await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorWidget = CustomProgressWidget()
    ..backgroundColor = Colors.transparent
    ..boxShadow = [BoxShadow(color:Colors.transparent)]
    ..indicatorColor = AppColors.WHITE
    ..textColor= AppColors.WHITE
    ..userInteractions = false
    ..progressColor= Colors.blue
    ..dismissOnTap = false
    ..fontSize = 20
  ;
  runApp(MultiProvider(
    providers: providersList,
    child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        child: const MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget with MyAppHelper{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return Consumer<LocalProvider>(builder: (context,value,child){
          EasyLocalization.of(context)!.setLocale(value.selectedLanguage);
          return MaterialApp(
            localizationsDelegates: EasyLocalization.of(context)?.delegates,
            supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
            locale: EasyLocalization.of(context)?.currentLocale!,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.BASE_COLOR),
              useMaterial3: true,
            ),
            builder: EasyLoading.init(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ), //set desired text scale factor here
                  child: child!,
                );
              },
            ),
            onGenerateRoute: onGenerateRoute,
            navigatorKey: AppNavigator().navigatorKey,
            home: const SplashScreen(),
          );
        },);
      },
    );
  }
}


