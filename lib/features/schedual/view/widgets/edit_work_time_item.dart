import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/costum_dropdown.dart';
import 'package:enaya_doctor/features/schedual/model/working_day_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_duration_model.dart';
import 'package:enaya_doctor/features/schedual/model/working_time_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditWorkDaysItem extends StatefulWidget {
  final WorkingDayModel workingDayModel;
  final List<WorkingTImeModel>allTimes;
  final List<WorkingDurationModel>allDurations;
  final Function(WorkingDayModel workingDayModel) onDataChanged;
  const EditWorkDaysItem({
    required this.workingDayModel,
    required this.allTimes,
    required this.allDurations,
    required this.onDataChanged,
    Key? key}) : super(key: key);

  @override
  State<EditWorkDaysItem> createState() => _EditWorkDaysItemState();
}

class _EditWorkDaysItemState extends State<EditWorkDaysItem> {
bool _isSwitched=false;
@override
  void initState() {
  _isSwitched=widget.workingDayModel.status=="1";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    widget.onDataChanged(widget.workingDayModel);
    return Column(children: [
      Row(children: [
        Switch(
          activeColor: AppColors.BASE_COLOR,
          value:_isSwitched ,
          onChanged: (value) {
            _isSwitched=!_isSwitched;
            widget.workingDayModel.status=="1"?
            widget.workingDayModel.status="0":
            widget.workingDayModel.status="1";
            setState(() {});
          },
        ),
        SizedBox(width: 2.w,),
        Text(
          LocalProvider().isEnglish()?widget.workingDayModel.day!.nameEn:widget.workingDayModel.day!.nameAr,
          style: const TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800),
        )
      ],),

      Visibility(
        visible:_isSwitched ,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w),
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
          child:Column(children: [
            Row(children: [
              Text(tr("from"),style: TextStyle(color: AppColors.GREY),),
              Expanded(
                child: CustomDropdown(
                  items: List.generate(widget.allTimes.length, (index){
                    return LocalProvider().isEnglish()?
                    widget.allTimes[index].timeEn:
                    widget.allTimes[index].timeAr;
                  }),
                  onSelect: (int index) {
                    widget.workingDayModel.timeFromId= widget.allTimes[index].id;
                    setState(() {});
                  },
                ),
              ),
              Text(tr("to"),style: TextStyle(color: AppColors.GREY),),
              Expanded(child: CustomDropdown(
                items: List.generate(widget.allTimes.length, (index){
                  return LocalProvider().isEnglish()?
                  widget.allTimes[index].timeEn:
                  widget.allTimes[index].timeAr;
                }),
                onSelect: (int index) {
                  widget.workingDayModel.timeToId= widget.allTimes[index].id;
                  setState(() {});
                },
              ))
            ],),
            SizedBox(width: double.infinity,
            child: Row(children: [
              Text(tr("duration"),style: TextStyle(color: AppColors.GREY),),
              Expanded(child: CustomDropdown(
                items: List.generate(widget.allDurations.length, (index){
                  return LocalProvider().isEnglish()?
                  widget.allDurations[index].durationEn:
                  widget.allDurations[index].durationAr;
                }),
                onSelect: (int index) {
                  widget.workingDayModel.durationId= widget.allDurations[index].id;
                  setState(() {});
                },
              ))
            ],),)
          ],),

        ),
      )
    ],);
  }
}
