import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:enaya_doctor/features/more/view/widgets/more_item_widget.dart';
import 'package:enaya_doctor/features/more/view_model/more_screen_helper.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget with MoreScreenHelper {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
    Column(children: [
      CustomActionBar(
        showBack: false,
        title:tr("more"),),
      Expanded(child:
      ListView(children:  [
        MoreItemWidget(title: 'change_language', icon: Icons.language,
          onClick: (){
            onChangeLanguageClick();
          },),
        MoreItemWidget(title: 'help_center', icon: Icons.help_outline,onClick: (){}),
        MoreItemWidget(title: 'about_us', icon: Icons.help_outline,onClick: (){
          onAboutUsClick();
        }),
        MoreItemWidget(title: 'log_out', icon: Icons.logout,onClick: (){
          onLogoutClick();
        })
      ],))


    ],),);
  }
}
