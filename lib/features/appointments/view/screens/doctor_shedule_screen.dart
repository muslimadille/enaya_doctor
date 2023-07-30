import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/appointments/appointMent_helper.dart';
import 'package:enaya_doctor/features/profile/view/widgets/profile_card_widget.dart';
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
            onTap: (){},
            child: ProfileCardWidget(
              showTitle: false,
              child: Row(children: [
                Expanded(child: Text(datesList[index].title,style: TextStyle(color: AppColors.GREY),)),
              ],),),
          ),
        );
      }) ,);
  }
}
