import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onClick;
  const MoreItemWidget({
    required this.title,
    required this.icon,
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom:6.w,left:2.w,right: 2.w),
      child: InkWell(
        onTap: (){
          onClick();
        },
        child: Row(children: [
           Icon(icon,color: AppColors.BASE_COLOR,),
          SizedBox(width: 2.w,),
          Expanded(child: Text(tr(title)))

        ],),
      ),
    );
  }
}
