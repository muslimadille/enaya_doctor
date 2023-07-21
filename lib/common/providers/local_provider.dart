import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/common/utils/constants/prefrances_keys.dart';
import 'package:flutter/material.dart';

class LocalProvider with ChangeNotifier{
  late final Locale selectedLanguage;

  setLanguage(String appLanguage)async {
    await AppConstants.prefs.setString(
        PreferencesKeys.LANGUAGE_KEY, appLanguage);
    selectedLanguage = Locale(appLanguage);
    notifyListeners();
  }

}