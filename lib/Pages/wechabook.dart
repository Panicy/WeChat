import 'package:flutter/material.dart';
import '../model/wechatBookData.dart' show WechatBookPageData,WechatBookData,INDEX_BAR_WORDS;
import '../contants.dart' show WechatBook,AppColors;
import 'package:transparent_image/transparent_image.dart';


class WeChatBookItem extends StatelessWidget {
  
  //2.构成函数
   WeChatBookItem({
     @required this.img,
     @required this.title,
     this.iTop,
     this.onPressed,
     this.titleIndex
   });
   //1.定义需要传入的值
   final String img;
   final String title;
   final String iTop;
   final String titleIndex;
   final VoidCallback onPressed; //定义点击事件VoidCallback

   bool get isImgFromNet{
     return this.img.startsWith('http') || this.img.startsWith('https');
   }
  

  @override
  Widget build(BuildContext context) {


    //用户头像
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

      //用户列表
    Widget _itemList=Container(
      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
       decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0,color: Color(AppColors.AppBarColor)))
        ),
      child:Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10.0),
        child:  Row(
          children: <Widget>[
            imageUrl,
            SizedBox(width: 10.0,),
            Text(title),
          ],
        ), 
      ),
    );

    //用户索引首字母
     Widget _itemIndex;
      if(this.titleIndex !=null){
        _itemIndex=Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: 20.0,
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              color: Color(AppColors.AppBarColor),
              child: Text(titleIndex,style: TextStyle(color: Colors.black26),),
            ),
            _itemList
          ],
        );
      }else{
        _itemIndex=_itemList;
      }

    return _itemIndex;
   
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
    // 排序
    _itemdata.sort((WechatBookData a, WechatBookData b)=>a.titleIndex.compareTo(b.titleIndex));

  }

   //索引组件
   final List<Widget> _indexTabItem=INDEX_BAR_WORDS.map((String word){ //map遍历
     return Expanded(
       child: Text(word,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.black38)),
     );
   }).toList();

  @override
  Widget build(BuildContext context) {
   
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context,int index){
            if(index<_iTopBookItem.length){
              return _iTopBookItem[index];
            }else{
            //index
            int _itemIndex=index-_iTopBookItem.length;
            final _itemdatas=_itemdata[_itemIndex];
            bool _isTitleIndex=true; //定义数据里面的titleindex是否一样 如果一样判断为false
            if(_itemIndex>=1 && _itemdatas.titleIndex == _itemdata[_itemIndex-1].titleIndex){
              _isTitleIndex=false;
            } 
            return WeChatBookItem(
              img:_itemdatas.img,
              title: _itemdatas.title,
              titleIndex:_isTitleIndex?_itemdatas.titleIndex:null//判断titleindex不能为空
              );
            }
          },
          itemCount: _itemdata.length+_iTopBookItem.length,
        ),
        Positioned(
          width: 24.0,
          top: 0,
          right: 0,
          bottom: 0,
          child:Container(
            child: Column(
              children: _indexTabItem,
            ),
          ) ,
        )
      ],
    );
  }
}