import 'dart:async';
import 'dart:convert';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_data.dart';
import 'package:enaya_doctor/features/auth/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/login_repo.dart';

mixin LoginScreenHelper{
  String phone="";
  String password="";
  late final StreamController<bool> loginButtonStreamController;
  late final GlobalKey<FormState> loginFormGlobalKey;

  onInit(){
    loginFormGlobalKey=GlobalKey<FormState>();
    loginButtonStreamController=StreamController<bool>();

  }
  onDispose(){
    loginButtonStreamController.close();
  }
  login()async{
    await LoginRepo().login(
        phone:AppNavigator().currentContext().read<CountryProvider>().selectedCountry.phoneCode
            +phone,password:password).then((value){
      LoginModel data= LoginModel.fromJson(value.data);
      AppConstants.prefs.setString("token", data.token);
    });
  }
}