import 'package:flutter/material.dart';
import '../model/wechatBookData.dart' show WechatBookPageData,WechatBookData;
import '../contants.dart' show WechatBook,AppColors;
import 'package:transparent_image/transparent_image.dart';


class WeChatBookItem extends StatelessWidget {
  
  //2.构成函数
   WeChatBookItem({
     @required this.img,
     @required this.title,
     this.iTop,
     this.onPressed
   });
   //1.定义需要传入的值
   final String img;
   final String title;
   final String iTop;
   final VoidCallback onPressed; //定义点击事件VoidCallback

   bool get isImgFromNet{
     return this.img.startsWith('http') || this.img.startsWith('https');
   }

  @override
  Widget build(BuildContext context) {

    Widget imageUrl;
    if(isImgFromNet){
      imageUrl= FadeInImage.memoryNetwork(
          placeholder:kTransparentImage,
          fadeInDuration: const Duration(seconds: 2),
          image:img,
          height: WechatBook.ImgSize,
          width: WechatBook.ImgSize,
        );
    }else{
      imageUrl=Image.asset(img,width: WechatBook.ImgSize,height: WechatBook.ImgSize,);
    }
    
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child:Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0,color: Color(AppColors.AppBarColor)))
        ),
        child:  Row(
          children: <Widget>[
            imageUrl,
            SizedBox(width: 10.0,),
            Text(title),
          ],
        ), 
      ),
    );
  }
}

class WeChatBook extends StatefulWidget {
  _WeChatBookState createState() => _WeChatBookState();
}
class _WeChatBookState extends State<WeChatBook> {
  //定义数据类型List
  final WechatBookPageData itemdata=WechatBookPageData.mock();
  final List<WechatBookData> _itemdata =[];

  final List<WeChatBookItem> _iTopBookItem=[
    WeChatBookItem(
      img: 'assets/images/ic_new_friend.png',
      title: '添加新朋友',
      onPressed: (){
        print('添加新朋友');
      },
    ),
    WeChatBookItem(
      img: 'assets/images/ic_group_chat.png',
      title:'群聊',
      onPressed: (){
        print('群聊');
      },
    ),
    WeChatBookItem(
      img: 'assets/images/ic_tag.png',
      title:'标签',
      onPressed: (){
        print('标签');
      },
    ),
    WeChatBookItem(
      img:'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: (){
        print('公众号');
      },
    )
  ];

  @override
  void initState() {
    super.initState();
    _itemdata..addAll(itemdata.wechatbookdata)..addAll(itemdata.wechatbookdata)..addAll(itemdata.wechatbookdata);

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        if(index<_iTopBookItem.length){
          return _iTopBookItem[index];
        }else{
        //index
        final _itemdatas=_itemdata[index-_iTopBookItem.length]; 
        return WeChatBookItem(img:_itemdatas.img,title: _itemdatas.title,);
        }
      },
      itemCount: _itemdata.length+_iTopBookItem.length,
    );
  }
}