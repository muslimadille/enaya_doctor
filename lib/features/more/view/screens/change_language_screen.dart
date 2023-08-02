import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/helper/app_navigator.dart';
import 'package:enaya_doctor/common/providers/local_provider.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/utils/constants/app_routes.dart';
import 'package:enaya_doctor/common/widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String _languageName='English';
  int _selectedIndex=0;
  List<String>_names=[
    "English",
    "عربي",
    "كورديي"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY,
      body:
      Column(children: [
        CustomActionBar(title:tr("change_language"),),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                decoration: BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.BLACK.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 1),
                    ]),
              child: Text(
                _languageName,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.GREY,fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),),
            ),
            Row(children:List.generate(3, (index){
              return Expanded(
                child: CheckboxListTile(
                    value: _selectedIndex==index,
                  title: Text(_names[index],style:TextStyle(color: AppColors.GREY,fontSize: AppFontSize.small,fontWeight: FontWeight.w800)),
                  onChanged:(value){
                      setState(() {
                        _selectedIndex=index;
                        _languageName=_names[index];
                      });
                },
                ),
              );
            }),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h,horizontal:4.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:AppColors.BASE_COLOR,
                  padding:  EdgeInsets.symmetric(vertical:2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: ()async{
                  await context.read<LocalProvider>().setLanguage(context.read<LocalProvider>().languagesList[_selectedIndex]);
                  AppNavigator().pushAndRemoveAll(routeName: AppRoutes.SPLASH_SCREEN_ROUTE);
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Text(tr("save"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.WHITE,
                          fontSize: AppFontSize.x_x_small,
                          fontWeight: FontWeight.w700
                      ),
                    )
                ),
              ),
            ),


          ],))


      ],),);
  }
}
