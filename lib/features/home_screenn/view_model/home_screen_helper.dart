import 'package:enaya_doctor/features/home_screenn/bottom_bar_model.dart';
import 'package:flutter/material.dart';

mixin HomeScreenHelper{
  int selectedIndex=0;

  List<BottomBarModel>bottomBarItems=[
    BottomBarModel(title: 'profile', icon: Icons.person,screen:Container(), ),
    BottomBarModel(title: 'schedule', icon: Icons.date_range,screen:Container(),),
    BottomBarModel(title: 'offers', icon: Icons.local_offer,screen:Container(),),
    BottomBarModel(title: 'more', icon: Icons.more_horiz,screen:Container(),)
  ];

}