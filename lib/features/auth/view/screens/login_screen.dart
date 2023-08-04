import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/common/widgets/custom_password_widget.dart';
import 'package:enaya_doctor/common/widgets/custom_phone_widget.dart';
import 'package:enaya_doctor/features/auth/viewModel/login_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginScreenHelper{
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
    return Scaffold(body:
      Column(children: [
         CustomActionBar(title:tr("login_screen_title"),),
       Expanded(child:
       ListView(children: [
         SizedBox(height: 6.h,),
         Image.asset(ImagePaths.IMG_LOGO_NAME_DARK,width: 70.w,),
         SizedBox(height: 6.h,),
         Form(
           key: loginFormGlobalKey,
           child: Column(children: [
             CustomPhoneWidget(
               onChange: (value){
                 phone=value;
               },
               validator: (value){
                 return null;
               },
             ),
             CustomPasswordWidget(
               hint: tr('password_hint'),
               onChange: (value){
                 password=value;
               },
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
                 onPressed: login,
                 child: SizedBox(
                     width: double.infinity,
                     child: Text(tr("login_screen_title"),
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: AppColors.WHITE,
                           fontSize: AppFontSize.x_x_small,
                           fontWeight: FontWeight.w700
                       ),
                     )
                 ),
               ),
             ),
             GestureDetector(onTap: (){},
                 child: Text(tr('forget_password_btn'),style: TextStyle(color: AppColors.BASE_COLOR),)),
             SizedBox(height: 2.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(tr('dont_have_account'),style: TextStyle(color: AppColors.GREY),),
                 GestureDetector(onTap: onRegisterClicked,
                     child: Text(tr('register_text_btn'),style: TextStyle(color: AppColors.BASE_COLOR),))
               ],)

           ],),),
       ],))


      ],),);
  }
}
