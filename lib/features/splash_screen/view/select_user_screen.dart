import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/features/splash_screen/view/widgets/select_user_Item_widget.dart';
import 'package:enaya_doctor/features/splash_screen/viewModel/select_user_screen_helper.dart';
import 'package:flutter/material.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> with SelectUserScreenHelper{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.IMG_BACKGROUND),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.IMG_LOGO_NAME_WHITE),
            Text(tr('select_user_type'),style:const TextStyle(color: AppColors.WHITE),),
            SelectUserItemWidget(icon:ImagePaths.IC_DOCTOR, title:tr('doctor'),
              onClick: onClick,),
            SelectUserItemWidget(icon:ImagePaths.IC_LAB, title:tr('laboratory'),
              onClick:onClick,),
            SelectUserItemWidget(icon:ImagePaths.IC_PHARMACY, title:tr('pharmacy'),
              onClick:onClick,)
          ],),
      ) ,
    );
  }
}
