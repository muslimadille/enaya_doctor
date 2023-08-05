import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoAppoinmenntsWidget extends StatelessWidget {
  const NoAppoinmenntsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(Icons.calendar_month_outlined,color: AppColors.GREY,size: 12.w,),
      SizedBox(height: 2.h,),
      Text("no_appoinments",textAlign: TextAlign.center,style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800,fontSize: AppFontSize.medium),)
    ],);
  }
}
