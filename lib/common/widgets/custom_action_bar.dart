import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomActionBar extends StatelessWidget {
  final String? title;
  final bool? showBack;
  const CustomActionBar({
    this.title,
    this.showBack,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.BASE_COLOR,
      padding: EdgeInsets.only(top:5.h,bottom: 1.h,left: 2.w,right: 2.w),
      child: Row(children: [
        Visibility(visible:showBack??false,child: SizedBox(width: 5.w,)),
        Expanded(child: Center(child: Text(title??'',style: TextStyle(color: AppColors.WHITE),))),
        Visibility(visible:showBack??false,child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),color: AppColors.WHITE,))
      ],),
    );
  }
}
