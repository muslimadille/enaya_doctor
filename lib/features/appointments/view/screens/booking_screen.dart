import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/country_provider.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/common/widgets/custom_email_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_input_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_phone_widget.dart';
import 'package:enaya_doctor/features/appointments/model/appointments_dates_model.dart';
import 'package:enaya_doctor/features/appointments/viewModel/doctor_appointments_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BookingScreen extends StatefulWidget {
  final Date date;
  const BookingScreen({
    required this.date,
    Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with DoctorAppointmentsHelper{
  @override
  void initState() {
    bookingDate="${widget.date.date} ${widget.date.selectedTime!.time}";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomActionBar(
              showBack: true,
              title: tr("book"),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(3.w),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top:2.w),
                    padding: EdgeInsets.symmetric(horizontal:2.w),
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ]),
                    child:Column(children: [
                      CustomInputWidget(
                        icon: Icons.person,
                        hint: tr("full_name"),
                        onChange: (value){
                          bookingName=value;
                        },
                      ),
                      CustomPhoneWidget(
                        onChange: (value){
                          bookingPhone= AppNavigator().currentContext().read<CountryProvider>().selectedCountry.phoneCode+value;
                        },
                        validator: (value){
                          return null;
                        },
                      ),
                      CustomEmailWidget(
                        onChange: (value){
                          bookingEmail=value;
                        },
                      ),
                    ],) ,
                  ),
                  Container(
                    margin: EdgeInsets.only(top:2.w),
                    padding: EdgeInsets.symmetric(horizontal:6.w),
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ]),
                    child:Row(children: [
                      Icon(Icons.access_time_rounded,color: AppColors.BASE_COLOR,),
                      SizedBox(width: 3.w,),
                      Container(height:6.h,width: 1,color: AppColors.LIGHT_GREY,),
                      SizedBox(width: 3.w,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("${LocalProvider().isEnglish()?widget.date.dayEn:widget.date.dayAr}",
                          textAlign: TextAlign.center,style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800,fontSize: AppFontSize.x_small),),
                        Text("${widget.date.date}   ${widget.date.selectedTime!.time}",textAlign: TextAlign.center,style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w400,fontSize: AppFontSize.x_small),)
                      ],),)
                    ],) ,
                  )
                ],),
              ),
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
                onPressed: onBookingClick,
                child: SizedBox(
                    width: double.infinity,
                    child: Text(tr("book"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.WHITE,
                          fontSize: AppFontSize.x_x_small,
                          fontWeight: FontWeight.w700
                      ),
                    )
                ),
              ),
            )
          ],
        ));
  }
}
