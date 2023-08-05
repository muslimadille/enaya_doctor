import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/appointments/view/widgets/no_appoinments_widget.dart';
import 'package:enaya_doctor/features/appointments/viewModel/doctor_appointments_helper.dart';
import 'package:enaya_doctor/features/more/model/about_us_model.dart';
import 'package:enaya_doctor/features/more/view_model/about_us_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';

class DoctorAppointmentsScreen extends StatelessWidget with DoctorAppointmentsHelper {
   DoctorAppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          onAddAppointmentClick();
        },
        child: Icon(Icons.add,color: AppColors.WHITE,),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomActionBar(
              title: tr("doctor_appointments_screen_title"),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(3.w),
                child: Column(children: [
                  GestureDetector(onTap: (){
                    MyAppHelper().pickDate();
                  },
                  child:Container(
                    margin: EdgeInsets.only(top:2.w),
                    padding: EdgeInsets.symmetric(horizontal:2.w),
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ]),
                    child:Row(children: [
                      Icon(Icons.calendar_month_outlined,color: AppColors.BASE_COLOR,),
                      SizedBox(width: 3.w,),
                      Container(height:6.h,width: 1,color: AppColors.LIGHT_GREY,),
                      Expanded(child: Text("20-05-2022",textAlign: TextAlign.center,style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800,fontSize: AppFontSize.x_x_small),),)
                    ],) ,
                  ),),
                  Expanded(child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top:2.w),
                    padding: EdgeInsets.symmetric(horizontal:2.w),
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ]),
                    child: NoAppoinmenntsWidget(),
                  ))
                ],),
              ),
            ),
          ],
        ));
  }
}
