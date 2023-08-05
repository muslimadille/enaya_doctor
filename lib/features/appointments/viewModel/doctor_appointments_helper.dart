import 'dart:convert';

import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/model/base_respose_model.dart';
import 'package:enaya_doctor/common/providers/profile_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/repo/appointments_repo.dart';
import 'package:provider/provider.dart';

mixin  DoctorAppointmentsHelper{
  List<Date>activeDates=[];
  onAddAppointmentClick(){
    AppNavigator().push(routeName: AppRoutes.DOCTOR_APPOINTMENT_TIMES_SCREEN_ROUTE);
  }
  Future<List<Date>> getDoctorAppointmentDates()async{
    int  id=AppNavigator().currentContext().read<ProfileProvider>().doctorModel!.id;
    await AppointmentRepo().getDoctorWorkingTimes(id).then((value){
      AppointmentDatesModel appointmentDatesModel=AppointmentDatesModel.fromJson(value.data);
      activeDates.clear();
      for(int i=0;i<appointmentDatesModel.dates.length;i++){
        if(appointmentDatesModel.dates[i].status==1&&(appointmentDatesModel.dates[i].times??[]).isNotEmpty){
          activeDates.add(appointmentDatesModel.dates[i]);
        }
      }
    });

    return activeDates;
  }
  onDateItemClick(Date date){
    AppNavigator().push(routeName: AppRoutes.DOCTOR_APPOINTMENTS_HOURS_SCREEN_ROUTE,arguments:date );
  }
}