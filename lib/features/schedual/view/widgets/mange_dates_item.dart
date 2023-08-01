import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ManageDatesItem extends StatelessWidget {
  final String title;
  final Widget body;
  final Function onEditClick;

  const ManageDatesItem({
    required this.title,
    required this.body,
    required this.onEditClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: AppColors.BLACK.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1),
          ]),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.BASE_COLOR,
                  ),
                ),
                Expanded(
                    child:
                    Text(title, style: TextStyle(color: AppColors.GREY))),
                IconButton(
                    onPressed: () {
                      onEditClick();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.BASE_COLOR,
                    ))
              ],
            ),
          ),
          Container(
            color: AppColors.LIGHT_GREY,
            height: 1,
            width: double.infinity,
          ),
          Expanded(child:body)
        ],
      ),
    );
  }

}