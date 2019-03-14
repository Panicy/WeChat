import 'package:flutter/material.dart';
import '../contants.dart' show AppColors;

class Conversation{
  const Conversation({
    @required this.img,
    @required this.title,
    this.text,
    this.titleColor:AppColors.ConversationTitleColor,
    this.isMute:false,
    this.time,
    this.mesnum:0,
    this.isRed,
    this.isTop:false
  })  : assert(img !=null),
      assert(title !=null),
      assert(time !=null);
  

final String img;
final String title;
final String text;
final String time;
final bool isMute;
final int titleColor;
final int mesnum;
final bool isRed;
final bool isTop;

bool isAvatarFromNet(){//判断头像是否来自网络
  if(this.img.indexOf('http')==0 || this.img.indexOf('https')==0){
    return true;
  }
  return false;
}
}

const List<Conversation> mockConversations=[
   const Conversation(
      img: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      text: '',
      time: '19:56',
    ),
    const Conversation(
      img: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      text: '豪车与出租车刮擦 俩车主划拳定责',
      time: '17:20',
    ),
    const Conversation(
      img: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      text: '25元现金助力开学季！',
      time: '17:12',
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      text: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      isMute: true,
      mesnum: 100,
      isTop: true
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      text: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      isMute: false,
      mesnum: 3,
    ),
    const Conversation(
      img: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      text: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      time: '17:12',
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      text: '今天要去运动场锻炼吗？',
      time: '昨天',
      isMute: false,
      mesnum: 99,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      text: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      isMute: true,
      mesnum: 0,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      text: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      isMute: false,
      mesnum: 3,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      text: '今天要去运动场锻炼吗？',
      time: '昨天',
      isMute: false,
      mesnum: 0,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      text: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      isMute: true,
      mesnum: 0,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      text: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      isMute: false,
      mesnum: 1,
    ),
    const Conversation(
      img: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      text: '今天要去运动场锻炼吗？',
      time: '昨天',
      isMute: false,
      mesnum: 0,
    ),
];
