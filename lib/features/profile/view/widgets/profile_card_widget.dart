import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileCardWidget extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? showTitle;
  final double?width;
  final double? height;

  const ProfileCardWidget({
    required this.child,
     this.title,
    this.showTitle,
    this.width,
    this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??double.infinity,
      padding: EdgeInsets.all(2.w),
      decoration:  BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color:AppColors.BASE_COLOR )
      ),
      child:Column(children: [
        (showTitle??true)?Text(title??'',style: TextStyle(color: AppColors.GREY,fontWeight: FontWeight.w800),):SizedBox(),
        SizedBox(height: (showTitle??true)?2.w:0,),
        child
      ],) ,
    );
  }
}
