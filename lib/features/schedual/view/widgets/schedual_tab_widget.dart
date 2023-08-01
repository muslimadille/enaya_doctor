import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SchedualTabWidget extends StatelessWidget {
  final Function onClick;
  final String title;
  final bool isSelected;
  const SchedualTabWidget({
    required this.title,
    required this.onClick,
    required this.isSelected,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h),
            child: Text(title,style: TextStyle(color:AppColors.GREY,fontWeight: FontWeight.w800),),
          ),
          Container(height: 1,color: isSelected?AppColors.BASE_COLOR:AppColors.GREY,)
        ],),
    );
  }
}
