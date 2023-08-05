import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/viewModel/doctor_appointments_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppointmentHoursScreen extends StatelessWidget with DoctorAppointmentsHelper {
  final Date date;
   AppointmentHoursScreen({
    required this.date,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomActionBar(
              title: tr("doctor_appointments_hours_screen_title"),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(3.w),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top:2.w),
                    padding: EdgeInsets.symmetric(horizontal:5.w,vertical: 1.h),
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ]),
                    child:  Text("${LocalProvider().isEnglish()?date.dayEn:date.dayAr} ${date.date}",textAlign: TextAlign.center,style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800,fontSize: AppFontSize.x_x_small),),
                  ),
                  Expanded(child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, ),
                    itemCount: date.times!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          onHourItemClick(date,date.times![index]);
                        },
                        child: Card(
                          color: AppColors.BASE_COLOR,
                          elevation: 2,
                          child: Center(
                            child: Text(date.times![index].time,style: TextStyle(color: AppColors.WHITE),),
                          ),
                        ),
                      );
                    },
                  ))
                ],),
              ),
            ),
          ],
        ));
  }
}
