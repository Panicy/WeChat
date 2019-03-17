import 'package:flutter/material.dart';
import '../model/wechatBookData.dart' show WechatBookPageData,WechatBookData;
import '../contants.dart' show WechatBook,AppColors;
import 'package:transparent_image/transparent_image.dart';


class WeChatBookItem extends StatelessWidget {
  
  //2.构成函数
   WeChatBookItem({
     @required this.img,
     @required this.title,
     this.iTop
   });
   //1.定义需要传入的值
   final String img;
   final String title;
   final String iTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child:Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0,color: Color(AppColors.AppBarColor)))
        ),
        child:  Row(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder:kTransparentImage,
              fadeInDuration: const Duration(seconds: 2),
              image:img,
              height: WechatBook.ImgSize,
              width: WechatBook.ImgSize,
            ),
            SizedBox(width: 10.0,),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class WeChatBook extends StatefulWidget {
  final Widget child;

  WeChatBook({Key key, this.child}) : super(key: key);

  _WeChatBookState createState() => _WeChatBookState();
}

class _WeChatBookState extends State<WeChatBook> {
  //定义数据类型List
  final List<WechatBookData>itemdata=WechatBookPageData.mock().wechatbookdata;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        //index
        final _itemdata=itemdata[index]; 
        return WeChatBookItem(img:_itemdata.img,title: _itemdata.title,);
      },
      itemCount: itemdata.length,
    );
  }
}