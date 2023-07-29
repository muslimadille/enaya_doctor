import 'package:enaya_doctor/features/profile/model/doctor_model.dart';
import 'package:enaya_doctor/features/profile/repository/profile_repo.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{
  DoctorModel? doctorModel;
  getDoctorProfile()async{
    await ProfileRepo().getDoctorProfile().then((value){
      doctorModel= DoctorModel.fromJson(value.data);
      notifyListeners();
    });
  }
}
