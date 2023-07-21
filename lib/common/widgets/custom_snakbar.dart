import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSnakbar {

  static CustomSnakbar? _singleton;

  factory CustomSnakbar() {
    _singleton = _singleton ?? CustomSnakbar._internal();
    return _singleton!;
  }

  CustomSnakbar._internal();


  appSnackBar({required String text,bool isFaild=true}) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: 8.h,right: 5.w,left: 5.w),
      duration: Duration(seconds: 4),
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          )
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: AppFontSize.x_x_small,
                  color: AppColors.WHITE,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
      backgroundColor: isFaild?AppColors.RED_FAILD:AppColors.GREEN_SUCCESS,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      padding:EdgeInsets.all(20) ,
      dismissDirection: DismissDirection.none,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(AppNavigator().currentContext()).showSnackBar(snackBar);
    });
  }

  hideSnackbar(){
    ScaffoldMessenger.of(AppNavigator().currentContext()).hideCurrentSnackBar();
  }

}