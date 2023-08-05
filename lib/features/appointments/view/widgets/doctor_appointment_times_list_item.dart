import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorAppointmentTimeItem extends StatelessWidget {
  const DoctorAppointmentTimeItem({
    required this.date,
    Key? key}) : super(key: key);
 final Date date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.w),
      padding: EdgeInsets.symmetric(vertical:1.h,horizontal: 3.w),
      decoration: BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: AppColors.BLACK.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1),
          ]),
      child: Row(children: [
        Icon(Icons.access_time_outlined,color: AppColors.BASE_COLOR,size: 8.w,),
        SizedBox(width: 2.w,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(LocalProvider().isEnglish()?date.dayEn:date.dayAr,style: TextStyle(color: AppColors.BASE_COLOR),),
          Text(date.date,style: TextStyle(color: AppColors.BASE_COLOR),),
          Text("from:${date.startTime} to:${date.endTime}",style: TextStyle(color: AppColors.GREY),)

        ],)),
        Icon(Icons.navigate_next,color: AppColors.GREY,size: 8.w,),
      ],),
    );
  }
}
