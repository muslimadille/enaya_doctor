import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/my_app_helper.dart';
import 'package:enaya_doctor/common/providers/appointments_provider.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_Progress.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/view/widgets/doctor_appointment_times_list_item.dart';
import 'package:enaya_doctor/features/appointments/view/widgets/no_appoinments_widget.dart';
import 'package:enaya_doctor/features/appointments/viewModel/doctor_appointments_helper.dart';
import 'package:enaya_doctor/features/more/model/about_us_model.dart';
import 'package:enaya_doctor/features/more/view_model/about_us_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DoctorAppointmentTimesScreen extends StatefulWidget {
   DoctorAppointmentTimesScreen({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentTimesScreen> createState() => _DoctorAppointmentTimesScreenState();
}

class _DoctorAppointmentTimesScreenState extends State<DoctorAppointmentTimesScreen>with DoctorAppointmentsHelper {
  @override
  void initState() {
    getDoctorAppointmentDates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
        body: Column(children: [
          CustomActionBar(
            title: tr("doctor_appointment_times_screen_title"),
          ),
          Expanded(child:
          Consumer<AppointmentsProvider>(
            builder: (context,model,_) {
              return model.activeDates.isNotEmpty?ListView.builder(
                itemCount: model.activeDates.length,
                  itemBuilder:(context,index){
                return GestureDetector(
                  onTap: (){
                    onDateItemClick(model.activeDates[index]);
                  },
                    child: DoctorAppointmentTimeItem(date: model.activeDates[index],));
              }):SizedBox();
            }
          ),)
        ],));
  }
}
