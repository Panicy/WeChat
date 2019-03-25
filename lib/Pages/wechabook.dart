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

    static const double PADDING_VERTICAL=10.0;
    bool get isImgFromNet{
      return this.img.startsWith('http') || this.img.startsWith('https');
    }
  
  //计算单个列表高度
    static double _height(bool hasTitleIndex){
      final _listHeight=PADDING_VERTICAL*2+1.0+40.0;
      if(hasTitleIndex){
        return _listHeight+20.0;
      }
      return _listHeight;
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
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child:  Row(
          children: <Widget>[
            imageUrl,
            SizedBox(width: 10.0,),
            Text(title,style: TextStyle(fontSize: 16.0),),
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
  String viewIndexZm='';
  _WeChatBookState createState() => _WeChatBookState();
}
class _WeChatBookState extends State<WeChatBook> {
  Color _indexTarBg=Colors.transparent;
  ScrollController _scrollController;
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
  
  final Map _listPosMap={INDEX_BAR_WORDS[0]:0.0};

  @override
  void initState() {
    super.initState();
    _itemdata..addAll(itemdata.wechatbookdata)..addAll(itemdata.wechatbookdata)..addAll(itemdata.wechatbookdata);
    // 排序
    _itemdata.sort((WechatBookData a, WechatBookData b)=>a.titleIndex.compareTo(b.titleIndex));
    //视图滚动
    _scrollController=new ScrollController();

    //计算IndexBar 的字母索引与页面titleIndex的高度
    var _totalPos=_iTopBookItem.length*WeChatBookItem._height(false);

    for(int i=0;i<_itemdata.length;i++){
      bool _hasTitleIndex=true;
      if(i>0 && _itemdata[i].titleIndex.compareTo(_itemdata[i-1].titleIndex)==0){
        _hasTitleIndex=false;
      }
      if(_hasTitleIndex){
        _listPosMap[_itemdata[i].titleIndex]=_totalPos;
      }
      _totalPos += WeChatBookItem._height(_hasTitleIndex);
    }

  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String getIndex(BuildContext context, double tileHeight, Offset globalPos){
    RenderBox _box=context.findRenderObject();
    var local=_box.globalToLocal(globalPos);
    //clamp设置一个区间
    int index=(local.dy ~/tileHeight).clamp(0, INDEX_BAR_WORDS.length-1);
    print(index);
    return INDEX_BAR_WORDS[index];
  }
  void _JumpToIndex(String index){
    if(index.isNotEmpty){
      final _pos=_listPosMap[index];
      if(_pos!=null){
        _scrollController.animateTo(_pos,duration:Duration(milliseconds: 200),curve: Curves.ease);
      }
    }

  }


  Widget _buidlIndexBar(BuildContext context,BoxConstraints constraints){
    final totalHeight=constraints.biggest.height;
    final double _tileHeight=totalHeight /_indexTabItem.length;
    print(_tileHeight);
    return GestureDetector(
            onVerticalDragDown: (DragDownDetails down){ //当一个触摸点开始跟屏幕交互，同时在垂直方向上移动时触发
              print('down');
              setState(() {
                _indexTarBg=Colors.black26;
               widget.viewIndexZm=getIndex(context,_tileHeight,down.globalPosition);
               _JumpToIndex(widget.viewIndexZm);
              });

            },
            onVerticalDragEnd: (DragEndDetails end){ //当用户停止移动，这个拖拽操作就被认为是完成了，就会触发这个回调
              print('end');
              setState(() {
                widget.viewIndexZm='';
               _indexTarBg=Colors.transparent; 
              });
            },
            onVerticalDragCancel: (){//用户突然停止拖拽时触发
              print('scroll');
               setState(() {
                widget.viewIndexZm='';
               _indexTarBg=Colors.transparent; 
              });
            },
            onVerticalDragUpdate: (DragUpdateDetails details){
               setState(() {
                _indexTarBg=Colors.black26;
               widget.viewIndexZm=getIndex(context,_tileHeight,details.globalPosition);
               _JumpToIndex(widget.viewIndexZm);
              });
            },
            child:Container(
              color:_indexTarBg,
              child: Column(
                children: _indexTabItem,
              ),
            ) ,
          );
  }

   //索引组件
   final List<Widget> _indexTabItem=INDEX_BAR_WORDS.map((String word){ //map遍历
     return Expanded(
       child: Text(word,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black38)),
     );
   }).toList();


  

  @override
  Widget build(BuildContext context) {
   Widget _viewIndex=Center(
          child: Container(
            height:84.0,
            width: 84.0,
            decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4.0)
            ),
            child: Center(
              child: Text(widget.viewIndexZm,style: TextStyle(fontSize: 44.0,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
      );
    final List<Widget> _body=[
        ListView.builder(
          controller: _scrollController,
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
          child:LayoutBuilder(
            builder:_buidlIndexBar,
          ),
        ),
    ] ; 
    if(widget.viewIndexZm.isNotEmpty){
      _body.add(_viewIndex);
    }
    return Stack(
      children:_body
      );
  }
}