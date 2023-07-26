import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/utils/constants/prefrances_keys.dart';
import 'package:flutter/material.dart';

class LocalProvider with ChangeNotifier{
  Locale selectedLanguage=Locale('ar',"EG");
  final languagesList=[
    "عربي",
    "English",
    "كوردي"
  ];

  setLanguage(String appLanguage)async {
    await AppConstants.prefs.setString(
        PreferencesKeys.LANGUAGE_KEY, appLanguage);
    switch(appLanguage){
      case "عربي":selectedLanguage = Locale('ar',"EG");
      case "English":selectedLanguage = Locale('en',"US");
      case "كوردي":selectedLanguage = Locale('ku');
      default :selectedLanguage=Locale('ar',"EG");
    }
    await EasyLocalization.of(AppNavigator().currentContext())?.setLocale(selectedLanguage);
    notifyListeners();
  }
  bool isEnglish(){
    return EasyLocalization.of(AppNavigator().currentContext())?.currentLocale==Locale("en","US")??false;
  }

}