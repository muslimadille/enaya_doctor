import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/features/profile/view/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  const ProfileInfoWidget({
    required this.title,
    required this.value,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
      child: ProfileCardWidget(
        showTitle: false,
          child:Row(children: [
            Text(title+" :",style: TextStyle(fontWeight: FontWeight.w800),),
            Text(value,style: TextStyle(color:AppColors.GREY,fontWeight: FontWeight.w400),),
          ],)
      ),
    );
  }
}
