import 'package:flutter/material.dart';

class BottomBarModel{
  final IconData icon;
  final String title;
  final Widget screen;


  BottomBarModel({
    required this.title,
    required this.icon,
    required this.screen
});
}