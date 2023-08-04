
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/widgets/pick_image_widget.dart';
import 'package:enaya_doctor/features/auth/model/register_request_model.dart';
import 'package:enaya_doctor/features/auth/repository/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


mixin RegisterHelper{
  late GlobalKey<FormState> registerFormGlobalKey;
  String firstNameAr="";
  String firstNameEn="";
  String lastNameAr="";
  String lastNameEn="";
  String password="";
  String confirmPassword="";
  String phone="";
  String feature="";
  String gender="";
  String email="";

  onInit(){
    registerFormGlobalKey=GlobalKey<FormState>();
  }
  RegisterRequestModel? registerRequestModel;
 doctorRegister()async{
   registerRequestModel=RegisterRequestModel(
       email: email,
       phonenumber: AppNavigator().currentContext().read<CountryProvider>().selectedCountry.phoneCode+phone,
       password: password,
       firstName_ar: firstNameAr,
       firstName_en: firstNameEn,
       lastName_ar: lastNameAr,
       lastName_en: lastNameEn,
       country_id: AppNavigator().currentContext().read<CountryProvider>().selectedCountry.id.toString(),
       gender_id: '1',
       featured: ''
   );
   await RegisterRepo().doctorRegister(model: registerRequestModel!);
 }
 onRegisterClick(){
   //if(registerFormGlobalKey.currentState!.validate()){}
   doctorRegister();
 }
 onUserImageClick(){
   MyAppHelper().showDialogWidget(widget:PickImageWidget(onSelectImage: (file,base64){
     feature=base64;
   },));
 }

}