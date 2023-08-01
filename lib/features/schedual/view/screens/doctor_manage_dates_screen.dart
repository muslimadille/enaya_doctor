import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/manage_dates_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/features/schedual/view_model/manage_dates_helper.dart';
import 'package:enaya_doctor/features/schedual/view/widgets/mange_dates_item.dart';
import 'package:enaya_doctor/features/schedual/view/widgets/vacation_list_item.dart';
import 'package:enaya_doctor/features/schedual/view/widgets/woking_time_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorMangeDatesScreen extends StatefulWidget {
  const DoctorMangeDatesScreen({Key? key}) : super(key: key);

  @override
  State<DoctorMangeDatesScreen> createState() => _DoctorMangeDatesScreenState();
}

class _DoctorMangeDatesScreenState extends State<DoctorMangeDatesScreen> with ManageDatesHelper{
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.LIGHT_GREY,
      child: Column(
        children: [
          Expanded(child:
          Consumer<ManageDatesProvider>(
            builder: (context,data,_) {
              return ManageDatesItem(
                title: tr('clinic_open_time'),
                onEditClick: onEditWorkTimesClick,
                body: data.isLoading?
                CustomProgressWidget():
                data.activeWorkingDays.isNotEmpty?
              ListView.builder(
                  itemCount: data.activeWorkingDays.length,
                    itemBuilder: (context,index){
                  return WorkingTimeItem(workingDayModel: data.activeWorkingDays[index],);
                }):Center(child:Text(tr('no_data')))
                ,);
            }
          )),
          Expanded(
              child: Consumer<ManageDatesProvider>(
                  builder: (context,data,_) {
                    return ManageDatesItem(
                      title: tr('vacation_dates'),
                      onEditClick: onAddVacationClick, body:
                    data.isLoading?CustomProgressWidget():data.vacations.isNotEmpty?
                    ListView.builder(
                        itemCount: data.vacations.length,
                        itemBuilder: (context,index){
                          return VacationListItem(vacationModel: data.vacations[index],
                            onDelete: (){
                              onDeleteVacation(data.vacations[index].id.toString());
                            },);
                        }):Center(child:Text(tr('no_data')))
                      ,);
                  }
              )
          )
        ]
        ,),
    );
  }
}
