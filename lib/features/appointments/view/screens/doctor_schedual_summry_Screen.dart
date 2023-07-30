import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/appointments/appointMent_helper.dart';
import 'package:enaya_doctor/features/appointments/view/widgets/schedual_tab_widget.dart';
import 'package:flutter/material.dart';


class DoctorScheduleSummeryScreen extends StatefulWidget {
  const DoctorScheduleSummeryScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScheduleSummeryScreen> createState() => _DoctorScheduleSummeryScreenState();
}

class _DoctorScheduleSummeryScreenState extends State<DoctorScheduleSummeryScreen>with AppointmentHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomActionBar(title:tr("Schedule_summary"),),
          Row(children:[
            Expanded(
              child: SchedualTabWidget(title:tr("Schedule"), onClick: (){
                pageController.jumpToPage(0);
                setState(() {});
              }, isSelected:currentIndex==0 ,),
            ),
            Expanded(
            child: SchedualTabWidget(title: tr("manage_dates"), onClick: (){
              pageController.jumpToPage(1);
              setState(() {});
            }, isSelected:currentIndex==1 ,)),
          ] ,),
        Expanded(child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: screens,
        )),
      ],
    ) ;
  }
}
