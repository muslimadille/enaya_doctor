import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/appointments/model/working_day_model.dart';
import 'package:enaya_doctor/features/appointments/model/working_time_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WorkingTimeItem extends StatelessWidget {
  final WorkingDayModel workingDayModel;
  const WorkingTimeItem({
    required this.workingDayModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(1.w),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(LocalProvider().isEnglish()?workingDayModel.day!.nameEn:workingDayModel.day!.nameAr,style: TextStyle(color: AppColors.GREY),),
          Text("${workingDayModel.timeFrom!.timeEn}_${workingDayModel.timeTo!.timeEn}",style: TextStyle(color: AppColors.GREY),),
        ],),
        Container(height: 1,color: AppColors.LIGHT_GREY,)
      ],),
    );
  }
}
