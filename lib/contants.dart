import 'package:flutter/material.dart';
/*
自定义样式
*/
class AppColors{
  static const AppBarColor=0xffECECEC; //16进制：0x 颜色透明度：ff 颜色值：3033030
  static const TabIconActive=0xff63C607;//底部导航激活时颜色
  static const TabIconNormal=0xff000000;//底部导航默认颜色
  static const AppBarTextColors=0xff000000;//头部导航字体颜色
  static const ConversationTitleColor=0xffECECEC;
}


class AppTextStyle{
  static const ListBgColor=0xffFFFFFF;
  static const ListTopBgColor=0xffECECEC;//好友置顶背景颜色
  static const ListTextColor= TextStyle(//好友最后一条消息颜色
    color:Color(0xffD1D1D1),
    fontSize: 12.0,
    
  );
  static const ListTileStyle= TextStyle(//好友昵称颜色
    fontSize: 16.0,
    color: Color(0xff353535),
    fontWeight: FontWeight.w500
  );
  static const ListNewColor=TextStyle(//公众号及其他昵称颜色
    color: Color(0xffD9CAC3),
    fontSize: 16.0
    );
   static const ListTime=TextStyle( //列表时间样式
     color: Color(0xffD1D1D1),
     fontSize: 12.0
   );
   static const ListImgWidth=40.0;//头像宽度
   static const ListImgHeight=40.0;//头像高度
   static const MesBgColor=0xffFF0329;//消息背景
   static const MesText=0xffFFFFFF;//消息数量
   static const MesWidth=20.0;//消息数量宽度
   static const MesRadius=20.0;//消息数量圆角
   static const MesStyle=TextStyle( //消息数量样式
     color: Color(MesText),
     fontSize: 12.0
   );
   static const MuteIconBg=0xffECECEC;
   static const MuteIconSize=18.0;
}


class Constants{
  static const IconFontFamily ='appIconFont';
}