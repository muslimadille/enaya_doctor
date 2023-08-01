import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/schedual/view/widgets/edit_work_time_item.dart';
import 'package:enaya_doctor/features/schedual/view_model/manage_dates_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditWorkingTimesScreen extends StatefulWidget {
  const EditWorkingTimesScreen({Key? key}) : super(key: key);

  @override
  State<EditWorkingTimesScreen> createState() => _EditWorkingTimesScreenState();
}

class _EditWorkingTimesScreenState extends State<EditWorkingTimesScreen>with ManageDatesHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(title:tr("edit_working_times"),),
        Consumer<ManageDatesProvider>(
          builder: (context,model,_) {
            return Expanded(child:
            ListView.builder(
              itemCount: model.workingDays.length,
                itemBuilder: (context,index){
              return EditWorkDaysItem(
                workingDayModel: model.workingDays[index],
                allDurations: model.allDurations,
                allTimes: model.allTimes,
                onDataChanged: ( workingDayModel) {
                    model.workingDays[index]=workingDayModel;
                    },
              );
            }));
          }
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
            onPressed: ()async{
              await context.read<ManageDatesProvider>().updateDoctorWorkDays();
              AppNavigator().goBack();
              },
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



      ],),);
  }
}
