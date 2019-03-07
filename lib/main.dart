import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'contants.dart' show AppColors;


void main()=>runApp(new MaterialApp(
  title: 'WeChat',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor)
  ),
  home: HomeScreen(),
));