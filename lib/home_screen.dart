import 'package:flutter/material.dart';
import 'contants.dart' show Constants,AppColors;
import './Pages/PageList.dart';
import './pages/wechat_page.dart';

/*定义底部导航*/
class NavigationIconView{
  BottomNavigationBarItem item;
  //构造器
  NavigationIconView({Key key,String title,IconData icon,IconData activeIcon}):
    item=new BottomNavigationBarItem(
      icon:Icon(icon,),
      activeIcon:Icon(activeIcon,),
      title:Text(title,style: TextStyle(
        fontSize: 14.0,
      ),),
      backgroundColor:Colors.white
    );
}


class HomeScreen extends StatefulWidget {
  final Widget child;

  HomeScreen({Key key, this.child}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController; //定义PageController 可滑动部件
  int _currentIndex=0;
  List<Widget> _pages; //页面
  List<NavigationIconView> _navigationIconViews;
  void initState(){
      super.initState();
      _pageController=PageController(initialPage: _currentIndex);
      _pages=[
       WeChatViewDemo(),
        Container(
          child: Text('2'),
        ),
        Container(
          child: Text('3'),
        ),
        Container(
          child: Text('4'),
        ),
      ];
      _navigationIconViews=[
        NavigationIconView(
          title: '微信',
          icon:IconData(
            0xe61c,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe61d,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '通讯录',
          icon:IconData(
            0xe601,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon:IconData(
            0xe600,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe657,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe655,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '我',
          icon:IconData(
            0xe606,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe607,
            fontFamily:Constants.IconFontFamily,
          )
        ),
      ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar=BottomNavigationBar(
      fixedColor: Color(AppColors.TabIconActive),//底部导航点击时的图标文字颜色
      items: _navigationIconViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex:_currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState((){
          _currentIndex=index;//点击底部导航切换
          _pageController.animateToPage(_currentIndex,duration:Duration(milliseconds: 200),curve:Curves.easeOut );//滑动Body切换底部导航
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信',style:TextStyle(
          color: Color(AppColors.AppBarTextColors),
          fontSize: 16.0

        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,color: Color(AppColors.AppBarTextColors),),
            onPressed: (){},
          ),
          // IconButton(
          //   icon: Icon(Icons.add,color: Color(AppColors.AppBarTextColors),),
          //   onPressed: (){
          //   },
          // )
          PopupMenuButton( //下拉选择框
            itemBuilder: (BuildContext ctx){
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: _buildPopupmenuIten(0xe60e,'发起群聊'),
                  value:'fqql'
                ),
                PopupMenuItem(
                  child: _buildPopupmenuIten(0xe60e,'添加朋友'),
                  value:'添加朋友'
                ),
                PopupMenuItem(
                  child: _buildPopupmenuIten(0xe60e,'扫一扫'),
                  value:'扫一扫'
                ),
                PopupMenuItem(
                  child: _buildPopupmenuIten(0xe60e,'收付款'),
                  value:'收付款'
                ),
                PopupMenuItem(
                  child: _buildPopupmenuIten(0xe60e,'帮助与反馈'),
                  value:'帮助与反馈'
                ),
              ];
            },
            icon: Icon(Icons.add,color: Color(AppColors.AppBarTextColors),),
            onSelected: (String selected){
              print(selected);
            },
          ),
        Container(width: 16.0,),

        ],
      ),
      body: PageView.builder( //Pageview 可滑动
        itemBuilder: (BuildContext context,int index){
          return _pages[index]; //页面显示第几个
        },
        controller: _pageController,
        itemCount: _pages.length, //页面个数
        onPageChanged: (int index){//滑动时改变底部导航状态
          setState(() {
           _currentIndex=index; 
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}


// 点击加号弹出框
_buildPopupmenuIten(int icon,String title){
  return Row(
    children: <Widget>[
      Icon(IconData(
        icon,
        fontFamily:Constants.IconFontFamily
      )),
      Container(width: 16.0,),
      Text(title)
    ],
  );
}