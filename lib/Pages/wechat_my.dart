import 'package:flutter/material.dart';
import './../contants.dart';
import '../ComplateDemo.dart';

class MyPageDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(AppColors.AppBarColor),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network('https://randomuser.me/api/portraits/men/86.jpg',width: 50.0,height: 50.0,),
                ),
                SizedBox(width: 20.0,),
                Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0,),
                        Text('Hey',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('微信号：Zap63492790'),
                            IconButton(
                              onPressed: (){
                              },
                              icon: Icon(IconData(
                                0xe654,
                                fontFamily: Constants.IconFontFamily
                              ),size: 16.0,),
                          )
                          ],
                        )
                    ],)
                  ],
                )
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //   
                //     SizedBox(height: 15.0,),
                //    
                //   ],
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: <Widget>[
                //     
                //   ],
                // )
                

              ],
            ),

          ),

          SizedBox(height: 16.0,),
          ListDemo(
              iconPath: 'assets/images/ic_wallet.png',
              title: '支付',
              onPressed: () {
                print('点击支付');
              },
            ),
            SizedBox(height: 16.0,),
            ListDemo(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showDivider: true,
              onPressed: () {
                print('点击收藏');
              },
            ),
            ListDemo(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showDivider: true,
              onPressed: () {
                print('点击相册');
              },
            ),
            ListDemo(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: '卡包',
              showDivider: true,
              onPressed: () {
                print('点击卡包');
              },
            ),
            ListDemo(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              showDivider: true,
              onPressed: () {
                print('点击表情');
              },
            ),
            SizedBox(height: 16.0,),
            ListDemo(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              onPressed: () {
                print('点击设置');
              },
            ),
        
        ],
      ),
    );


  }


}