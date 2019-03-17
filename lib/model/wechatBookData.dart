import 'package:flutter/cupertino.dart';



class WechatBookData{

  //2.构造函数
  const WechatBookData({
    @required this.title,
    @required this.img,
    this.titleIndex,
  });

  // 1.final定义数据类型
  final String title;  
  final String img;
  final String titleIndex;
}

// 3.定义数据
class WechatBookPageData{
  final List<WechatBookData>  wechatbookdata=[
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/53.jpg',
      title: 'Maurice Sutton',
      titleIndex: 'M',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/76.jpg',
      title: 'Jerry',
      titleIndex: 'J',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/17.jpg',
      title: 'Dangdang',
      titleIndex: 'D',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/55.jpg',
      title: 'Teddy',
      titleIndex: 'T',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/11.jpg',
      title: 'Steave',
      titleIndex: 'S',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/65.jpg',
      title: 'Vivian',
      titleIndex: 'V',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/50.jpg',
      title: 'Mary',
      titleIndex: 'M',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/91.jpg',
      title: 'David',
      titleIndex: 'D',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/women/60.jpg',
      title: 'Bob',
      titleIndex: 'B',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/60.jpg',
      title: 'Jeff Green',
      titleIndex: 'J',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/45.jpg',
      title: 'Adam',
      titleIndex: 'A',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/7.jpg',
      title: 'Michel',
      titleIndex: 'M',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/35.jpg',
      title: 'Green',
      titleIndex: 'G',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/64.jpg',
      title: 'Jack Ma',
      titleIndex: 'J',
    ),
    const WechatBookData(
      img: 'https://randomuser.me/api/portraits/men/86.jpg',
      title: 'Tom',
      titleIndex: 'T',
    ),
    const WechatBookData(
      img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537868900176&di=ddbe94a75a3cc33f880a5f3f675b8acd&imgtype=0&src=http%3A%2F%2Fs2.sinaimg.cn%2Fmw690%2F003wRTwMty6IGZWzd2p31',
      title: '张伟',
      titleIndex: 'Z',
    ),
    const WechatBookData(
      img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1537858866&di=fe35e4465c73122f14e1c9475dd68e47&src=http://a2.att.hudong.com/63/26/01300001128119143503262347361.jpg',
      title: '张益达',
      titleIndex: 'Z',
    ),

    

  ];

// 4.输出数据
  static WechatBookPageData mock(){
    return WechatBookPageData();
  }
}