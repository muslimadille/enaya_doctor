import 'package:enaya_doctor/features/home_screen/bottom_bar_model.dart';
import 'package:enaya_doctor/features/more/view/screens/more_screen.dart';
import 'package:enaya_doctor/features/offers/view/screens/offers_screen.dart';
import 'package:flutter/material.dart';

mixin HomeScreenHelper{
  int selectedIndex=0;

  List<BottomBarModel>bottomBarItems=[
    BottomBarModel(title: 'profile', icon: Icons.person,screen:Container(), ),
    BottomBarModel(title: 'schedule', icon: Icons.date_range,screen:Container(),),
    BottomBarModel(title: 'offers', icon: Icons.local_offer,screen:const OffersScreen(),),
    BottomBarModel(title: 'more', icon: Icons.more_horiz,screen:const MoreScreen(),)
  ];

}