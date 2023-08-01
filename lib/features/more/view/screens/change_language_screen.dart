import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(title:tr("more"),),
        Expanded(child: Column(children: [

        ],))


      ],),);
  }
}
