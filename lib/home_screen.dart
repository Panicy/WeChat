import 'package:flutter/material.dart';
import 'contants.dart' show Constants,AppColors;

/*定义底部导航*/
class NavigationIconView{
  String _title; 
  IconData _icon;
  IconData _activeIcon;
  BottomNavigationBarItem item;

  //构造器
  NavigationIconView({Key key,String title,IconData icon,IconData activeIcon}):
    _title=title,
    _icon=icon,
    _activeIcon=activeIcon,
    item=new BottomNavigationBarItem(
      icon:Icon(icon,color: Color(AppColors.TabIconNormal),),
      activeIcon:Icon(activeIcon,color: Color(AppColors.TabIconActive),),
      title:Text(title,style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal)
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
  List<NavigationIconView> _navigationIconViews;
  void initState(){
      super.initState();
      _navigationIconViews=[
        NavigationIconView(
          title: '微信',
          icon:IconData(
            0xe6ae,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe60e,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '通讯录',
          icon:IconData(
            0xe625,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon:IconData(
            0xe62a,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe732,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe746,
            fontFamily:Constants.IconFontFamily,
          )
        ),
        NavigationIconView(
          title: '我',
          icon:IconData(
            0xe646,
            fontFamily:Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe634,
            fontFamily:Constants.IconFontFamily,
          )
        ),
      ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar=BottomNavigationBar(
      items: _navigationIconViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex:0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('666');
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
            },
          )
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}