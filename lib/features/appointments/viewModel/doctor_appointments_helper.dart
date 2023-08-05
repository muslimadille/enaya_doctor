import 'dart:convert';

import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/appointments_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:provider/provider.dart';

mixin  DoctorAppointmentsHelper{
  String bookingName="";
  String bookingEmail="";
  String bookingPhone="";
  String bookingDate="";
  onAddAppointmentClick(){
    AppNavigator().push(routeName: AppRoutes.DOCTOR_APPOINTMENT_TIMES_SCREEN_ROUTE);
  }
  getDoctorAppointmentDates()async{
    AppNavigator().currentContext().read<AppointmentsProvider>().getDoctorAppointmentDates();
  }
  onDateItemClick(Date date){
    AppNavigator().push(routeName: AppRoutes.DOCTOR_APPOINTMENTS_HOURS_SCREEN_ROUTE,arguments:date );
  }
  onHourItemClick(Date date,Time time){
    date.selectedTime=time;
    AppNavigator().push(routeName: AppRoutes.DOCTOR_BOOKING_SCREEN_ROUTE,arguments:date );

  }


  doctorAddBooking()async{
    await AppNavigator().currentContext().read<AppointmentsProvider>().doctorAddBooking(
        name: bookingName,
        email: bookingEmail,
        phonenumber: bookingPhone,
        booking_date: bookingDate);
  }
  onBookingClick()async{
    await doctorAddBooking();
  }
  getAllDocReservations(DateTime date)async{
    await AppNavigator().currentContext().read<AppointmentsProvider>().getAllDoctorReservations(date);
  }
}