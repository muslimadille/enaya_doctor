import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/schedual/model/vacation_model.dart';
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
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(2.w),
                    child: Row(children: [
                      Text(tr("from"),style: TextStyle(color: AppColors.GREY),),
                      Text(vacationModel.startDate.toString().split(" ")[0],style: TextStyle(color: AppColors.GREY),),
                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(2.w),
                    child: Row(children: [
                      Text(tr("to"),style: TextStyle(color: AppColors.GREY),),
                      Text(vacationModel.endDate.toString().split(" ")[0],style: TextStyle(color: AppColors.GREY),),
                    ],),
                  )
                ],),
            ),
            IconButton(icon:Icon(Icons.delete,color: AppColors.RED,),
              onPressed: () {
              onDelete();
              },)
          ],),
          Container(height: 2,color: AppColors.LIGHT_GREY,)
        ],
      ),
    );
  }
}
