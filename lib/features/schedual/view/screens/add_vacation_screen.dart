import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/schedual/view_model/add_vacation_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddVacationScreen extends StatefulWidget {
  const AddVacationScreen({Key? key}) : super(key: key);

  @override
  State<AddVacationScreen> createState() => _AddVacationScreenState();
}

class _AddVacationScreenState extends State<AddVacationScreen> with AddVacationHelper{
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(title:tr("add_vacation_screen_title"),),

        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
             margin:EdgeInsets.symmetric(vertical:1.h,horizontal: 4.w),
             decoration:  BoxDecoration(
               color: AppColors.WHITE,
               borderRadius: BorderRadius.all(Radius.circular(5)),
               boxShadow: [
                 BoxShadow(
                     color: AppColors.BLACK.withOpacity(0.1),
                     blurRadius: 5,
                     spreadRadius: 1),
               ]
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Padding(
                 padding:  EdgeInsets.all(2.w),
                 child: Text(tr("add_vacation_screen_title"),style: TextStyle(color: AppColors.GREY),),
               ),
               Container(height: 2,color: AppColors.LIGHT_GREY,),
                 GestureDetector(
                   onTap: ()async{
                     fromDate=await MyAppHelper().pickDate();
                     setState(() {});
                   },
                   child: Container(
                     width: double.infinity,
                     color: AppColors.WHITE,
                     padding:  EdgeInsets.all(2.w),
                     child: Row(children: [
                       Text(tr("from"),style: TextStyle(color: AppColors.GREY),),
                       Text(fromDate!=null?fromDate.toString().split(" ")[0]:"",style: TextStyle(color: AppColors.GREY),),
                     ],),
                   ),
                 ),
                 GestureDetector(
                   onTap: ()async{
                     toDate=await MyAppHelper().pickDate();
                     setState(() {});
                   },
                   child: Container(
                     width: double.infinity,
                     color: AppColors.WHITE,
                     padding:  EdgeInsets.all(2.w),
                     child: Row(children: [
                       Text(tr("to"),style: TextStyle(color: AppColors.GREY),),
                       Text(toDate!=null?toDate.toString().split(" ")[0]:"",style: TextStyle(color: AppColors.GREY),),
                     ],),
                   ),
                 )
             ],),
           ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h,horizontal:4.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor:AppColors.BASE_COLOR,
                padding:  EdgeInsets.symmetric(vertical:2.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: fromDate!=null&&toDate!=null?()async{
                addVacation(start_date:fromDate.toString(), end_date:toDate.toString());
              }:null,
              child: SizedBox(
                  width: double.infinity,
                  child: Text(tr("save"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.WHITE,
                        fontSize: AppFontSize.medium,
                        fontWeight: FontWeight.w700
                    ),
                  )
              ),
            ),
          ),
        ],))



      ],),);
  }

}
