import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectUserItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Function onClick;
  const SelectUserItemWidget({
    required this.icon,
    required this.title,
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onClick();
      },
      child: Container(
        width: 35.w,
        height: 15.h,
        margin:EdgeInsets.only(top: 2.h),
        padding:EdgeInsets.only(top: 2.w),
        decoration: const BoxDecoration(
            color: AppColors.WHITE,
            borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                icon,
              width: 18.w,
              height: 18.w,
            ),
            SizedBox(height: 1.h,),
            Text(title,style: const TextStyle(color: AppColors.GREY),)
          ],
        ),
      ),
    );
  }
}
