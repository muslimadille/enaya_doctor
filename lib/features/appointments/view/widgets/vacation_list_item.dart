import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/appointments/model/vacation_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VacationListItem extends StatelessWidget {
  final VacationModel vacationModel;
  final Function onDelete;
  const VacationListItem({
    required this.vacationModel,
    required this.onDelete,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(1.w),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(vacationModel.startDate.toString(),style: TextStyle(color: AppColors.GREY),),
            Text(vacationModel.endDate.toString(),style: TextStyle(color: AppColors.GREY),),
          ],),
        IconButton(icon:Icon(Icons.delete,color: AppColors.RED,),
          onPressed: () {  },)
      ],),
    );
  }
}
