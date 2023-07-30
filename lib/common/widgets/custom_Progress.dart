import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressWidget extends StatelessWidget {
  const CustomProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.BASE_COLOR,
      size: 50.0,
    );
  }
}
