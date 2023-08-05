import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/profile_provider.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/model/reservation_model.dart';
import 'package:enaya_doctor/features/appointments/repo/appointments_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsProvider with ChangeNotifier{
  List<Date>activeDates=[];
  List<ReservationModel>allDocReservations=[];

   getDoctorAppointmentDates()async{
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
    notifyListeners();
  }
  doctorAddBooking({
    required String name,
    required String email,
    required String phonenumber,
    required String booking_date
  })async{
    await AppointmentRepo().doctorAddBooking(name: name, email: email, phonenumber: phonenumber, booking_date: booking_date);
    await getDoctorAppointmentDates();
  }
  getAllDoctorReservations(DateTime date)async{
    await AppointmentRepo().getDoctorAllReservations().then((value){
      allDocReservations.clear();
      allDocReservations.addAll(ReservationModel.fromList(value.data).where((element) =>DateFormat('yyyy-MM-dd').format(element.bookingDate)==DateFormat('yyyy-MM-dd').format(date)));
    });
    notifyListeners();
  }
}