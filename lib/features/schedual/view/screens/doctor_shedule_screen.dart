import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/profile/view/widgets/profile_card_widget.dart';
import 'package:enaya_doctor/features/schedual/view_model/appointMent_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorScheduleScreen extends StatefulWidget {
  const DoctorScheduleScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> with AppointmentHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.LIGHT_GREY,
      child:ListView.builder(
        itemCount: datesList.length,
          itemBuilder: (context,index){
        return Padding(
          padding:  EdgeInsets.all(2.w),
          child: InkWell(
            onTap: (){
              onDateClick(datesList[index].date);
            },
            child: ProfileCardWidget(
              showTitle: false,
              child: Row(children: [
                Expanded(child: Text(datesList[index].title,style: TextStyle(color: AppColors.GREY),)),
                Row(children: [
                  Icon(Icons.check_circle_outline,color: AppColors.BASE_COLOR,),
                  Text(tr("confirm"),style: TextStyle(color: AppColors.GREY),)
                ],),
                SizedBox(width: 3.w,),
                Row(children: [
                  Icon(Icons.cancel_outlined,color: AppColors.BASE_COLOR,),
                  Text(tr("cancel"),style: TextStyle(color: AppColors.GREY))
                ],),
              ],),),
          ),
        );
      }) ,);
  }
}
