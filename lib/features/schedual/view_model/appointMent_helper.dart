import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/features/schedual/model/doctor_schedule_model.dart';
import 'package:enaya_doctor/features/schedual/view/screens/doctor_manage_dates_screen.dart';
import 'package:enaya_doctor/features/schedual/view/screens/doctor_shedule_screen.dart';
import 'package:flutter/material.dart';

mixin AppointmentHelper{
  int currentIndex = 0;
  List<DoctorScheduleModel> datesList=[];

  late final PageController pageController ;
  final List<Widget>screens=[
    const DoctorScheduleScreen(),
    const DoctorMangeDatesScreen()
  ];

  onInit(){
    generateDatesList();
    pageController=PageController(initialPage: 0);
  }
  onDispose(){
    pageController.dispose();
  }
  Future generateDatesList()async{
    DateTime currentDay=DateTime.now().toLocal();
    datesList.add(DoctorScheduleModel(
        date:currentDay,
        title:dayName(currentDay)
    ));
    for(int i=0;i<12;i++){
      currentDay=currentDay.add(Duration(days: 1));
      datesList.add(DoctorScheduleModel(
          date:currentDay,
        title:dayName(currentDay)
      ));

    }
  }
  String dayName(DateTime date){
    final DateFormat formatter = DateFormat('EEEE d MMMM',Localizations.localeOf(AppNavigator().currentContext()).languageCode);
    return formatter.format(date);
  }


}