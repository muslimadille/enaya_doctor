import 'package:easy_localization/easy_localization.dart';
import 'package:enaya_doctor/common/utils/constants/app_colors.dart';
import 'package:enaya_doctor/common/utils/constants/app_font_size.dart';
import 'package:enaya_doctor/common/utils/constants/image_paths.dart';
import 'package:enaya_doctor/features/home_screen/view_model/home_screen_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeScreenHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:bottomBarItems[selectedIndex].screen,

      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: AppColors.WHITE,
        elevation: 20,
        currentIndex: selectedIndex,
        onTap: (int index){
            setState(() {
              selectedIndex = index;
            });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
            color: AppColors.BASE_COLOR,
            fontSize: AppFontSize.x_small,
            fontWeight: FontWeight.w500
        ),
        unselectedLabelStyle: TextStyle(
            color: AppColors.GREY,
            fontSize: AppFontSize.x_small,
            fontWeight: FontWeight.w500
        ),
        selectedFontSize: AppFontSize.x_small,
        unselectedFontSize: AppFontSize.x_small,
        items: List.generate(bottomBarItems.length, (index){
          return BottomNavigationBarItem(
            icon: Icon(bottomBarItems[index].icon),
            label: tr(bottomBarItems[index].title),
            activeIcon:Icon(bottomBarItems[index].icon,color: AppColors.BASE_COLOR,),
          );
        })
      ),
    );
  }
}

