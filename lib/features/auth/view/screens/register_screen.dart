import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/common/widgets/custom_email_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_gender_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_input_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_password_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_phone_widget.dart';
import 'package:enaya_doctor/features/auth/viewModel/register_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with RegisterHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(2.h),
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.IMG_BACKGROUND,),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              SizedBox(height: 5.h,),
              Text(tr("register_doctor"),style: TextStyle(color: AppColors.WHITE,fontSize: AppFontSize.large,fontWeight: FontWeight.w800),),
              Image.asset(
                ImagePaths.IMG_LOGO_NAME_WHITE,
                width: 70.w,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                margin: EdgeInsets.symmetric(vertical: 2.h),
                decoration: const BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                child:Form(
                  child: Column(children: [
                    Text(tr("register_card_title"),style: TextStyle(color: AppColors.BASE_COLOR,fontSize: AppFontSize.medium,fontWeight: FontWeight.w500),),
                    Container(color: AppColors.BASE_COLOR,width: 30.w,height: 2,),
                    SizedBox(height: 2.h,),

                     CustomInputWidget(
                       icon: Icons.person,
                       hint: tr("full_name_ar"),
                       onChange: (value){
                         firstNameAr=value.split(" ")[0];
                         lastNameAr=value.split(" ")[1]??" ";
                       },
                     ),
                    CustomInputWidget(
                      icon: Icons.person,
                      hint: tr("full_name_en"),
                      onChange: (value){
                        firstNameEn=value.split(" ")[0];
                        lastNameEn=value.split(" ")[1]??" ";
                      },
                    ),
                    CustomPhoneWidget(
                      onChange: (value){
                        phone=value;
                      },
                      validator: (value){
                        return null;
                      },
                    ),
                    CustomEmailWidget(
                      onChange: (value){
                        email=value;
                      },
                    ),
                    CustomPasswordWidget(
                      hint: tr('password_hint'),
                      onChange: (value){
                        password=value;
                      },
                    ),
                    CustomPasswordWidget(
                      hint: tr('confirm_password_hint'),
                      onChange: (value){
                        confirmPassword=value;
                      },
                    ),
                     CustomGenderWidget(onSelect: (value){
                       gender=value.toString();
                     },)
                  ],),
                ),
              ),
              GestureDetector(
                onTap: onRegisterClick,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(3.w),
                  margin: EdgeInsets.symmetric(vertical:3.w,horizontal:15.w),
                  decoration: const BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(tr("register"),style: TextStyle(color: AppColors.BASE_COLOR,fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),

                ),
              )
            ],),
        ),
      ) ,
    );
  }

}
