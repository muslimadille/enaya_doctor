import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/providers/profile_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/profile/model/doctor_model.dart';
import 'package:enaya_doctor/features/profile/view/widgets/circular_image.dart';
import 'package:enaya_doctor/features/profile/view/widgets/profile_card_widget.dart';
import 'package:enaya_doctor/features/profile/view/widgets/profile_info_widget.dart';
import 'package:enaya_doctor/features/profile/view_model/doctor_profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> with ProfileHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(title:tr("profile"),),

        Consumer<ProfileProvider>(builder: (context,data,_){
          DoctorModel? doctorModel=data.doctorModel;
          return doctorModel!=null?Expanded(
            child: SingleChildScrollView(child:
            Padding(
              padding:  EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 2.h),
                    child: ProfileCardWidget(
                      showTitle: false,
                      width: 40.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(children: [
                          Icon(Icons.edit,color: AppColors.BASE_COLOR,),
                          SizedBox(width: 1.w,),
                          Text(tr("edite_profile"))
                        ],),
                      ),),
                  ),
                  /// profile info
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ProfileCardWidget(
                          title: tr("profile_info"),
                          child: Column(children: [
                            ProfileInfoWidget(title:tr("email"), value:doctorModel.email??""),
                            ProfileInfoWidget(title:tr("mobile"), value: doctorModel.phonenumber??"",),
                            ProfileInfoWidget(title:tr("password"), value: '********',),
                          ],)),
                      Positioned(
                          top: -5.h,
                          child:CircularImage(
                            size: 18.w,
                            image: doctorModel.featured??"") )
                    ],),
                  /// career info
                  Padding(
                    padding:  EdgeInsets.only(top:2.h),
                    child: ProfileCardWidget(
                        title: tr("career_info"),
                        child: Column(children: [
                          ProfileInfoWidget(title:tr("full_name"), value: LocalProvider().isEnglish()?
                          "${doctorModel.firstNameEn} ${doctorModel.lastNameEn}":"${doctorModel.firstNameAr} ${doctorModel.lastNameAr}",),
                          ProfileInfoWidget(title:tr("about_doctor"), value:LocalProvider().isEnglish()?doctorModel.aboutDoctorEn:doctorModel.aboutDoctorAr,),
                          ProfileInfoWidget(title:tr("specialist"), value: LocalProvider().isEnglish()?doctorModel.profissionalTitleEn:doctorModel.profissionalTitleAr
                            ,),
                        ],)),
                  ),
                  ///address
                  Padding(
                    padding:  EdgeInsets.only(top:2.h),
                    child: ProfileCardWidget(
                        title: tr("address_info"),
                        child: Column(children: [
                          ProfileInfoWidget(title:tr("address"), value:LocalProvider().isEnglish()?doctorModel.addressEn:doctorModel.addressAr,),
                          ProfileInfoWidget(title:tr("landmark"), value: LocalProvider().isEnglish()?doctorModel.landmarkEn:doctorModel.landmarkAr,),
                        ],)),
                  ),
                  ///clinic info
                  Padding(
                    padding:  EdgeInsets.only(top:2.h),
                    child: ProfileCardWidget(
                        title: tr("clinic_info"),
                        child: Column(children: [
                          ProfileInfoWidget(title:tr("clinic_name"), value: doctorModel.clinicName??"",),
                          ProfileInfoWidget(title:tr("clinic_services"), value:doctorModel.clinicServices.join(" ") ,),
                        ],)),
                  )
                ],),
            )),
          ):SizedBox.shrink();
        })


      ],),);
  }
}
